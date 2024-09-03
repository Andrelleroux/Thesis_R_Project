library(tidyverse)
library(plm)
library(stargazer)

Two_Way_Fix_Eff <- function(){
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
        select(countrycode, year, ln_Gdp_pc, l_pop, hc, l_cn) %>%
        na.omit()

    Two_Way_Fixed_Mod <- plm(ln_Gdp_pc ~ l_pop + hc + l_cn, data = Model_Data, model = "within", effect = "twoways")

    stargazer(Two_Way_Fixed_Mod, "text", out = "Two_Way_table.html")
}