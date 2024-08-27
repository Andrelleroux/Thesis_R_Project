library(tidyverse)
library(broom)
library(plm)
library(stargazer)

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

OLS_reg <- Model_Data %>%
    group_by(countrycode) %>%
    group_map(~ broom::tidy(lm(ln_Gdp_pc ~ l_pop + hc + l_cn + ctfp, data = .x)))

Pool_OLS_reg <- plm(ln_Gdp_pc ~ l_pop + hc + l_cn + ctfp, data = Model_Data, model = "pooling")

#stargazer(OLS_reg, "html", out = "OLS_table.html")

stargazer(Pool_OLS_reg, "html", out = "pooled_table.html")





