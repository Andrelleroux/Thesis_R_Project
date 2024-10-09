library(tidyverse)
library(broom)
library(stargazer)

OLS_model <- function(data = Model_Data){

OLS_reg <- data %>%
    group_by(countrycode) %>%
    group_map(~ lm(ln_Gdp ~ l_pop + hc + l_cn, data = .x), .keep = T)

#stargazer(OLS_reg, "html", out = "OLS_table.html")

OLS_reg

}


