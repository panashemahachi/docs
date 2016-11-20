source('simulation.R')

estimate_parameters <- function (simulation_data) {
  #y is the market price variation (MP[t+1]-MP[t])
  y = simulation_data$market_price[-1] - simulation_data$market_price[-nrow(simulation_data)]
  #x1 is the price error (TP[t]-MP[t])
  x1 = simulation_data$target_price - simulation_data$market_price
  #remove the last data point so we have the same lenght as y
  x1 = x1[-length(x1)]
  #x2 is the annual deflation rate at time t
  x2 = simulation_data$deflation_rate
  #remove the last data point so we have the same lenght as y
  x2 = x2[-length(x2)]
  #fit the linear regression
  fit <- lm(y ~ x1 + x2, data = data.frame(y,x1,x2))
  #get the coefficients of the regression
  coef = coefficients(fit)
  #remove the names of the coefficients from the vector
  names(coef) = NULL
  estimated_price_spread_sensitivity = coef[2]
  estimated_deflation_spread_sensitivity = coef[3]
  estimated_DRE = -coef[1]/coef[3]
  #return the result as a named vector with the names used in the paper
  return(c(a = estimated_price_spread_sensitivity, 
           b = estimated_deflation_spread_sensitivity,
           DRE = estimated_DRE))
}



# let's estimate the parameters of a simulation using linear regression
example1 = 
  run_simulation(
    initial_target_price = 0.71,
    initial_market_price = 0.71,
    initial_deflation = 0.02,
    DRE = 0.03,
    price_spread_sensitivity = 0.5,
    deflation_spread_sensitivity = 0.3,
    Kp = 0.3,
    Ki = 0.0005,
    noise = 0, #no noise, for simplicity
    SDS = list(
      list(t = c(5/365,15/365),
           type = 'step',
           amp = 0)), #no SDS, for simplicity
    simulation_name = "Linear Regression Example #1")
#linear regression using all data points
estimate_parameters(example1)


# same example, with noise
example1a = 
  run_simulation(
    initial_target_price = 0.71,
    initial_market_price = 0.71,
    initial_deflation = 0.02,
    DRE = 0.03,
    price_spread_sensitivity = 0.5,
    deflation_spread_sensitivity = 0.3,
    Kp = 0.3,
    Ki = 0.0005,
    noise = 0.0005,
    SDS = list(
      list(t = c(5/365,15/365),
           type = 'step',
           amp = 0)), #no SDS, for simplicity
    simulation_name = "Linear Regression Example #1a")
#linear regression using all data points
estimate_parameters(example1a)

# same example, with noise and SDS
example1b = 
  run_simulation(
    initial_target_price = 0.71,
    initial_market_price = 0.71,
    initial_deflation = 0.02,
    DRE = 0.03,
    price_spread_sensitivity = 0.5,
    deflation_spread_sensitivity = 0.3,
    Kp = 0.3,
    Ki = 0.0005,
    noise = 0.0005,
    SDS = list(
      list(t = c(5/365,10/365),
           type = 'step',
           amp = 0.01)),
    simulation_name = "Linear Regression Example #1b")
#linear regression using all data points
estimate_parameters(example1b)
#         a          b        DRE 
#0.07136885 0.01657426 0.02433765 
#the SDS has a significant impact on the estimates
#but if we fit the model using only the second half of the dataset
estimate_parameters(example1b[(trunc(nrow(example1b)/2)):(nrow(example1b)),])