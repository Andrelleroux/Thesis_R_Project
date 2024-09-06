library(tidyverse)
library(plm)
library(stargazer)

Pooled_OLS <- function(data = Model_Data){

    Pool_OLS_reg <- plm(ln_Gdp ~ l_pop + hc + l_cn, data = data, model = "pooling")

}