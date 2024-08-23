library(tidyverse)

Data_setup = function(data = "data/Data_1.csv"){

Init_Data = read_csv("data/Data_1.csv")

Top_GDP = Init_Data %>%
    select(rgdpo, countrycode, year) %>%
    filter(!is.na(rgdpo)) %>%
    filter(year == 1950) %>%
    top_n(30, rgdpo) %>%
    pull(countrycode)

GDP_Data = Init_Data %>%
    mutate(l_rgdpo = log(rgdpo)) %>%
    select(l_rgdpo, countrycode, year) %>%
    filter(!is.na(l_rgdpo), countrycode %in% Top_GDP) %>%
    spread(countrycode, l_rgdpo)

return(GDP_Data)

}