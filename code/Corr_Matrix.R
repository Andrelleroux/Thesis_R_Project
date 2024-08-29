library(tidyverse)

Init_Data <- read_csv("data/Data_PWT.csv")

Countries <- c("ARG", "AUS", "AUT", "BEL", "BRA", "CAN", "CHE", "COL",
               "DEU", "DNK", "ESP", "FIN", "FRA", "GBR", "IND", "ITA", "JPN",
               "MEX", "NGA", "NLD", "NOR", "PHL", "SWE", "THA", "TUR",
               "USA", "VEN", "ZAF")

Model_Data <- Init_Data %>%
    filter(countrycode %in% Countries) %>%
    select(countrycode, year, rgdpe) %>%
    spread(countrycode, rgdpe) %>%
    select(-year)

Cor_Mat <- cor(Model_Data)
Cor_Mat <- apply(Cor_Mat, c(1, 2), function(x) x^15)

diag(Cor_Mat) <- 0

Weight_Mat <- apply(Cor_Mat, 2, function(col) col / sum(col))

Weight_Mat