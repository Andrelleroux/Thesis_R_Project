library(tidyverse)

Model_Testing <- function(Pool_Mod = Pool, Two_Way_Mod = Two_way, OLS = OLS_Mods){

    Init_Data = read_csv("data/Data_PWT.csv")

    Countries <- c("ARG", "AUS", "AUT", "BEL", "BRA", "CAN", "CHE", "COL",
                   "DEU", "DNK", "ESP", "FIN", "FRA", "GBR", "IND", "ITA", "JPN",
                   "MEX", "NGA", "NLD", "NOR", "PHL", "SWE", "THA", "TUR",
                   "USA", "VEN", "ZAF")

    Test_Data <- Init_Data %>%
        mutate(ln_Gdp_pc = log(rgdpe/pop)) %>%
        mutate(l_pop = log(pop)) %>%
        mutate(Labour_Ratio = emp/pop) %>%
        filter(countrycode %in% Countries) %>%
        mutate(l_cn = log(cn)) %>%
        select(countrycode, year, ln_Gdp_pc, l_pop, hc, l_cn) %>%
        filter(year > 2014)

    pred_Pool <- predict(Pool_OLS_reg, newdata = Test_Data)

    Pool_RMSE <- sqrt(mean((Test_Data$ln_Gdp_pc - pred_Pool)^2))

    pred_Two_Way <- predict(Two_Way_Fixed_Mod, newdata = Test_Data)

    Two_Way_RMSE <- sqrt(mean((Test_Data$ln_Gdp_pc - pred_Two_Way)^2))

    all_residuals <- c()

    for (i in length(OLS_reg)) {
        model <- OLS_reg[[i]]

        country_data <- Test_Data %>% filter(countrycode == Countries[i])

        predictions <- predict(model, newdata = country_data)

        residuals <- country_data$ln_Gdp_pc - predictions

        all_residuals <- c(all_residuals, residuals)
    }

    OLS_RMSE <- sqrt(mean((all_residuals)^2))

}