library(tidyverse)
library(plm)
library(stargazer)

Pooled_OLS <- function(){
    Init_Data <- read_csv("data/Data_PWT.csv")

    Countries <- c("ARG", "AUS", "AUT", "BEL", "BRA", "CAN", "CHE", "COL",
                   "DEU", "DNK", "ESP", "FIN", "FRA", "GBR", "IND", "ITA", "JPN",
                   "MEX", "NGA", "NLD", "NOR", "PHL", "SWE", "THA", "TUR",
                   "USA", "VEN", "ZAF")

    Model_Data <- Init_Data %>%
        mutate(ln_Gdp_pc = log(rgdpe/pop)) %>%
        mutate(l_pop = log(pop)) %>%
        mutate(Labour_Ratio = emp/pop) %>%
        filter(countrycode %in% Countries) %>%
        mutate(l_cn = log(cn)) %>%
        select(countrycode, year, ln_Gdp_pc, l_pop, hc, l_cn, ctfp)

    Pool_OLS_reg <- plm(ln_Gdp_pc ~ l_pop + hc + l_cn + ctfp, data = Model_Data, model = "pooling")

    stargazer(Pool_OLS_reg, "text", out = "pooled_table.html")
}