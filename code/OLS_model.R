library(tidyverse)
library(broom)

Init_Data <- read_csv("data/Data_1.csv")

Countries <- c("ARG", "AUS", "AUT", "BEL", "BRA", "CAN", "CHE", "COD", "COL",
               "DEU", "DNK", "ESP", "FIN", "FRA", "GBR", "IND", "ITA", "JPN",
               "MEX", "NGA", "NLD", "NOR", "PAK", "PHL", "SWE", "THA", "TUR",
               "USA", "VEN", "ZAF")

Model_Data <- Init_Data %>%
    filter(!is.na(rgdpe)) %>%
    mutate(ln_Gdp_pc = log(rgdpe/pop)) %>%
    mutate(Labour_Ratio = emp/pop) %>%
    filter(countrycode %in% Countries) %>%
    mutate(l_cn = log(cn)) %>%
    select(countrycode, year, ln_Gdp_pc, l_cn, hc, Labour_Ratio, ctfp, csh_g, xr, csh_m, csh_x) %>%
    na.omit() %>%
    group_by(countrycode) %>%
    group_map(~ broom::tidy(lm(ln_Gdp_pc ~ l_cn + hc + Labour_Ratio + ctfp + csh_g + xr + csh_m + csh_x, data = .x)))






