library(tidyverse)

Data_setup = function(data_loc = "data/Data_PWT.csv"){

Init_Data = read_csv("data/Data_PWT.csv")

Top_GDP = Init_Data %>%
    select(rgdpo, countrycode, year) %>%
    filter(!is.na(rgdpo)) %>%
    filter(year == 1950) %>%
    top_n(30, rgdpo) %>%
    pull(countrycode)

Countries <- c("ARG", "AUS", "AUT", "BEL", "BRA", "CAN", "CHE", "COL",
               "DEU", "DNK", "ESP", "FIN", "FRA", "GBR", "IND", "ITA", "JPN",
               "MEX", "NGA", "NLD", "NOR", "PHL", "SWE", "THA", "TUR",
               "USA", "VEN", "ZAF")

Model_Data <- Init_Data %>%
    mutate(ln_Gdp = log(rgdpe)) %>%
    mutate(l_pop = log(pop)) %>%
    mutate(Labour_Ratio = emp/pop) %>%
    filter(countrycode %in% Countries) %>%
    mutate(l_cn = log(cn)) %>%
    select(countrycode, year, ln_Gdp, l_pop, hc, l_cn) %>%
    filter(year <= 2014)

return(Model_Data)

}