library(forecast)
library(tidyverse)
library(timetk)

Years_list <- Model_Data %>% select(year) %>% as.vector()

ARIMA_mod <- function(data = time_data) {

    year_range <- 1950:2014

    arima_models <- data %>%
        group_by(countrycode) %>%
        summarise(
            model = list(auto.arima(ts(ln_Gdp, frequency = 1), seasonal = FALSE)),
            .groups = "drop"
        )

    # Generate fitted values for the data used in training
    fitted_values_ARIMA <- arima_models %>%
        mutate(
            fitted_ARIMA = map(model, ~fitted(.x))  # Extract fitted values from the model
        ) %>%
        unnest(fitted_ARIMA) %>%  # Unnest the list of fitted values
        group_by(countrycode) %>%
        mutate(
            year = year_range[1:length(fitted_ARIMA)]  # Assign years 1950 to 2014 to the fitted values
        ) %>%
        select(-model)
}


