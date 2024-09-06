library(tidyverse)
library(plm)
library(stargazer)

Two_Way_Fix_Eff <- function(data = Model_Data){

    Two_Way_Fixed_Mod <- plm(ln_Gdp ~ l_pop + hc + l_cn, data = data, model = "within", effect = "twoways")

}