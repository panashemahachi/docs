source('simulation.R')


# Scenario #1
# For no reason other than chance, the deflation rate at launch 
# equals the deflation rate of equilibrium. The Dai is trading at 
# target price. On day 5, there's a sudden increase in demand which 
# is not quickly met by an equivalent increase in supply.
run_simulation(
  initial_target_price = 0.71,
  initial_market_price = 0.71,
  initial_deflation = 0.03,
  DRE = 0.03,
  noise = 0,
  SDS = list(
    list(t = 5/365,
         type = 'exp',
         amp = 0.01)),
  simulation_name = "Scenario #1")

# Scenario #2
# As is more likely to happen, the deflation rate at launch is not equal 
# to the deflation rate of equilibrium. In this case, it is lower.
# On day 5, there's a sudden increase in demand which 
# is not met by an equivalent increase in supply. This lasts until day 15.
run_simulation(
  initial_target_price = 0.71,
  initial_market_price = 0.71,
  initial_deflation = 0.02,
  DRE = 0.03,
  noise = 0,
  SDS = list(
    list(t = c(5/365,15/365),
         type = 'step',
         amp = 0.01)),
  simulation_name = "Scenario #2")

# Scenario #1 + PI controller
run_simulation(
  initial_target_price = 0.71,
  initial_market_price = 0.71,
  initial_deflation = 0.03,
  DRE = 0.03,
  Kp = 0.3,
  Ki = 0.0005,
  noise = 0,
  SDS = list(
    list(t = 5/365,
         type = 'exp',
         amp = 0.01)),
  simulation_name = "Scenario #1 + PI controller")

# Scenario #2 + PI controller
run_simulation(
  initial_target_price = 0.71,
  initial_market_price = 0.71,
  initial_deflation = 0.02,
  DRE = 0.03,
  Kp = 0.3,
  Ki = 0.0005,
  noise = 0,
  SDS = list(
    list(t = c(5/365,15/365),
         type = 'step',
         amp = 0.01)),
  simulation_name = "Scenario #2 + PI controller")

# Scenario #2, new market params + old PI controller
run_simulation(
  initial_target_price = 0.71,
  initial_market_price = 0.71,
  initial_deflation = 0.02,
  deflation_spread_sensitivity = 0.05,
  DRE = 0.03,
  Kp = 0.3,
  Ki = 0.0005,
  noise = 0,
  SDS = list(
    list(t = c(5/365,15/365),
         type = 'step',
         amp = 0.01)),
  simulation_name = "Scenario #2, new market params + old PI controller")

# Scenario #2, new market params + new PI controller
run_simulation(
  initial_target_price = 0.71,
  initial_market_price = 0.71,
  initial_deflation = 0.02,
  deflation_spread_sensitivity = 0.05,
  DRE = 0.03,
  Kp = 1.5,
  Ki = 0.0005,
  noise = 0,
  SDS = list(
    list(t = c(5/365,15/365),
         type = 'step',
         amp = 0.01)),
  simulation_name = "Scenario #2, new market params + new PI controller")



# Scenario #3
# Several SDS functions at different points in time. No controller.
run_simulation(
  initial_target_price = 0.71,
  initial_market_price = 0.71,
  initial_deflation = 0.02,
  DRE = 0.03,
  noise = 0.005,
  SDS = list(
    list(t = 2/365,
         type = 'exp',
         amp = 0.01),
    list(t = c(5/365, 7/365),
         type = 'step',
         amp = -0.01),
    list(t = c(8/365, 10/365),
         type = 'step',
         amp = 0.05),
    list(t = 12/365,
         type = 'exp',
         amp = 0.04),
    list(t = 13/365,
         type = 'exp',
         amp = -0.09)
  ),
  simulation_name = "Scenario #3")


# Scenario #3
# Several SDS functions at different points in time. With controller.
run_simulation(
  initial_target_price = 0.71,
  initial_market_price = 0.71,
  initial_deflation = 0.02,
  DRE = 0.03,
  noise = 0.005,
  SDS = list(
    list(t = 2/365,
         type = 'exp',
         amp = 0.01),
    list(t = c(5/365, 7/365),
         type = 'step',
         amp = -0.01),
    list(t = c(8/365, 10/365),
         type = 'step',
         amp = 0.05),
    list(t = 12/365,
         type = 'exp',
         amp = 0.04),
    list(t = 13/365,
         type = 'exp',
         amp = -0.09)
  ),
  Kp = 0.3,
  Ki = 0.0005,
  simulation_name = "Scenario #3 + PI controller")
