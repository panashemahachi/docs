library(stats)
#-------- CONSTANTS
block_interval = 14 #seconds between each block in Ethereum

#-------- AUXILIARY VARIABLES AND FUNCTIONS
get_years <- function (blocks) {
  return ((blocks * block_interval) / (365*24*60*60))
}


run_simulation <- function (initial_deflation = 0.02, #annual deflation at launch
                            initial_target_price = 0.71, #target price at launch
                            initial_market_price = 0.71, #market price at launch
                            Kp = 0, #proportional component of the PI controller for deflation
                            Ki = 0, #integral component of the PI controller for deflation
                            price_spread_sensitivity = 0.5, #a number between 0 and 1. The larger this number, the stronger is the reaction to deviations in market price relative to the target price
                            DRE = 0.03, #annual deflation that, in a noiseless market with zero price spread, would have no impact on supply and demand (ie. market price would remain the same)
                            deflation_spread_sensitivity = 0.5, #the larger this number, the stronger is the reaction to deviations in deflation relative to the DRE
                            noise = 0.005, #standard deviation of random variations in market price
                            years_to_simulate = 30/365, #number of years of simulation to run
                            control_variable = "ADJ", #DEF if control variable is the deflation itself; ADJ if control variable is the deflation adjustment
                            SDS = list( #a list of SDS functions; 
                              list( #each SDS is itself another list, containing
                                c(5/365, 15/365), #containing the time at which it occurs
                                'step', #the kind of function (step or exp)
                                0)), #the amplitude
                            simulation_name = "Simulation Data",
                            plot_data = TRUE
) {
  
  simulation_data = data.frame(time = 0, 
                               deflation_rate = initial_deflation, 
                               target_price = initial_target_price, 
                               market_price = initial_market_price,
                               sds_data = 0)
  i=1
  next_time = 0
  error_integral = 0
  while (next_time<years_to_simulate) {
    #the duration of each iteration varies (normal distribution), but it can't be less than one block
    duration = get_years(max(c(1,rnorm(1,mean=500,sd=100))))
    
    #calculate the current error in price and store the accumulated sum (integral)
    error = simulation_data$target_price[i] - simulation_data$market_price[i]
    error_integral = error_integral + error * duration
    
    #calculate the time of the next iteration
    next_time = simulation_data$time[i] + duration
    
    #calculate the next target price based on current deflation and time that will pass between now and the next iteration
    next_tp = simulation_data$target_price[i] * (1+simulation_data$deflation_rate[i])^duration
    
    #calculate the next market price (see model description for details)
    reaction1 = price_spread_sensitivity * error
    reaction2 = deflation_spread_sensitivity * (simulation_data$deflation_rate[i] - DRE)
    reaction3 = rnorm(1, mean = 0, sd = noise) #generate one random number from a normal distribution
    reaction4 = 0
    for (j in 1:length(SDS)) { #for every SDS in the list of SDS's
      if (SDS[[j]][[2]]=='step') { #if the SDS if of type 'step'
        if (next_time > SDS[[j]][[1]][1] && next_time < SDS[[j]][[1]][2]) { #for the duration of the step
          reaction4 = reaction4 + SDS[[j]][[3]] #increase the market price by the given amplitude
        }
      } else if (SDS[[j]][[2]]=='exp') { #if the SDS if of type 'exp'
        if (next_time > SDS[[j]][[1]][1]) { #from the time the SDS starts
          reaction4 = reaction4 + SDS[[j]][[3]] * exp(-(next_time - SDS[[j]][[1]][1])*200) #increase the market price by a negative exponential
        }
      }
    }
    next_sds = reaction4 #store the combined SDS for future reference

    next_mp = simulation_data$market_price[i] + reaction1 + reaction2 + reaction3 + reaction4
    
    #apply control logic to deflation rate
    prop = Kp * error
    int = Ki * error_integral
    if (Kp == 0 && Ki == 0) {
      next_defl = simulation_data$deflation_rate[i] #if all the parameters of the controller are zero, keep deflation constant
    } else if (control_variable == "ADJ") {
      next_defl = simulation_data$deflation_rate[i] + prop + int
    } else {
      next_defl = prop + int  
    }
    #a deflation rate of -100% or less is not practical (ie. the target price of the Dai can't be 0 or negative)
    if (next_defl<=-1) next_defl = -.99
    
    #add row to simulation data
    simulation_data = rbind(simulation_data, c(next_time, next_defl, next_tp, next_mp, next_sds))
    
    i = i + 1
  }
  
  if (plot_data) {
    
    #if the SDS curve has any information in it, draw the plot
    if (sum(simulation_data$sds_data)!=0) {
      #graphical definitions for the plot (margins, etc)
      par(mfrow=c(1,1),
          mar=c(5,4,4,5)+.1,
          xpd = FALSE)
      
      #draw the SDS curve
      plot(simulation_data$time*365, simulation_data$sds_data, type="l", col="green", 
           main = paste(simulation_name, "Shocks in Supply and Demand"),
           xlab="Time (days)", ylab="Effect of the shock on the price of the Dai (in SDR)",
           ylim=c(min(simulation_data$sds_data), 
                  max(simulation_data$sds_data)))
    }
  
    
    #graphical definitions for the plot (margins, etc)
    par(mfrow=c(1,1),
        mar=c(5,4,4,5)+.1,
        xpd = FALSE)
    
    #draw the market price
    plot(simulation_data$time*365, simulation_data$market_price, type="l", col="green", 
         main = simulation_name,
         xlab="Time (days)", ylab="Price of the Dai (in SDR)",
         ylim=c(min(c(simulation_data$target_price, simulation_data$market_price)), 
                max(c(simulation_data$target_price, simulation_data$market_price))))
    #draw the target price on same plot as market price
    lines(simulation_data$time*365, simulation_data$target_price, col="red")
    
    #draw the deflation rate on the same plot with a secondary y-axis
    par(new = T)
    plot(simulation_data$time*365, simulation_data$deflation_rate*100, 
         xaxt="n",yaxt="n",
         xlab=NA, ylab=NA, type="l", col="blue")
    axis(side = 4)
    mtext('Annual Deflation Rate (%)', side = 4, line = 3)
    
    #add grid lines to plot
    grid()
    
    #write the parameters of the simulation on top of the chart
    params_text = paste0("Initial TP=", initial_target_price, 
                         "; Initial MP=", initial_market_price, 
                         "; Price Sensit.=", price_spread_sensitivity,
                         "; Deflation Sensit.=", deflation_spread_sensitivity,
                         "; DRE=", DRE*100, "%",
                         "; initial_deflation=", initial_deflation*100, "%",
                         "; \nnoise=", noise)
    
    if (length(SDS) == 1) { #if there's only one SDS function, write its parameters on top of the chart
      if (sum(simulation_data$sds_data)==0) {
        params_text = paste0(params_text, "; no SDS")
      } else if (SDS[[1]][2] == 'step') {
        params_text = paste0(params_text, 
                             "; SDS=", SDS[[1]][[2]], " ",  
                             SDS[[1]][[3]], " between days ", 
                             SDS[[1]][[1]][1]*365, " and ", SDS[[1]][[1]][2]*365)
      } else {
        params_text = paste0(params_text, 
                             "; SDS=", SDS[[1]][[2]], " ",  
                             SDS[[1]][[3]], " on day ", 
                             SDS[[1]][[1]][1]*365)
      } 
    } else if (length(SDS) > 1) { #if there are more than one SDS function, refer the user to the plot of the SDS curve 
      params_text = paste0(params_text, 
                           "; see previous plot for the several SDS functions being simulated")
    }
    
    if (Kp == 0 && Ki == 0) {
      params_text = paste0(params_text, "; No controller")
    } else {
      params_text = paste0(params_text, "; Kp=", Kp, "; Ki=", Ki)
    }
    mtext(params_text, cex = 0.8)
    
    #add legend
    legend("bottomright",
           col=c("green","red","blue"),
           lty=1,
           legend=c("Market price","Target price","Annual Defl. Rate"))
  }
  
  return(simulation_data)
}