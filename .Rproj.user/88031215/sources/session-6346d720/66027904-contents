library(tidyverse)

OLS_mods <- ols_results %>% select(model) %>% as.list()
ARIMA_mods <- arima_models %>% select(model) %>% as.list()

R_sqr <- c()
tidy_model <- data.frame()
tidy_model_ARIMA <- data.frame()

for (i in 1:28) {

    R_temp <- summary(OLS_mods$model[[i]])$adj.r.squared
    R_sqr <- c(R_sqr, R_temp)

    tidy_temp <- tidy(OLS_mods$model[[i]]) %>%
        select(term, estimate, p.value)

    tidy_model <- rbind(tidy_model, tidy_temp)

    tidy_temp_ARIMA <- tidy(ARIMA_mods$model[[i]]) %>%
        mutate(
            t_stat = estimate / std.error,
            p_value = 2 * (1 - pnorm(abs(t_stat)))
        ) %>%
        select(term, estimate, p_value)

    tidy_model_ARIMA <- rbind(tidy_model_ARIMA, tidy_temp_ARIMA)
}

data_OLS_coef <- tidy_model %>% group_by(term) %>%
    summarise(Coef_Mean = mean(estimate), p_val_mean = mean(p.value))

data_ARIMA_coef <- tidy_model_ARIMA %>% group_by(term) %>%
    summarise(Coef_Mean = mean(estimate), p_val_mean = mean(p_value))


OLS_coef <- data.frame(
    Variable <- c("Intercept", "Human Capital", "Log Population", "Log Capital Stock", "Adj R Squared",
                  "AR1", "AR2", "AR3", "drift", "MA1", "MA2" ),
    OLS_Coefficients <- c(0.572, 0.313, 2.45, 0.336, 0.9880, "-", "-", "-", "-", "-", "-"),
    OLS_P_val <- c(0.0396, 0.144, 0.103, 0.0353, "-", "-", "-", "-", "-", "-", "-"),
    TWFE_coefficients <- c("-", -0.0430, 0.0031, 0.722, 0.6241, "-", "-", "-", "-", "-", "-"),
    TWFE_pval <- c("-", 0.313, 0.904, 0, "-", "-", "-", "-", "-", "-", "-"),
    ARIMA_Coefficients <- c("-", "-", "-", "-", "-", 0.241, -0.459, -0.323, 0.0384, -0.270, -0.175),
    ARIMA_P_val <- c("-", "-", "-", "-", "-", 0.0160, 0.0001, 0.0061, 0.0027, 0.0808, 0.0293)
)

OLS_coef %>%
    kbl(
        caption = "Estimates of Econometric Models",
        col.names = c("Variables", "OLS Coeff", "OLS p-val", "TWFE Coeff", "TWFE p-val",
                      "ARIMA Coeff", "ARIMA p-val"),
        align = "lc",  # Align columns (left and center)
        booktabs = TRUE  # Use LaTeX-style professional rules
    ) %>%
    kable_styling(
        bootstrap_options = c("striped", "hover", "condensed"),  # Add striped rows and hover effect
        full_width = FALSE,  # Keep the table compact
        font_size = 12       # Adjust font size
    ) %>%
    row_spec(0, bold = TRUE, color = "white", background = "black") %>%  # Style the header row
    column_spec(1, width = "3cm", bold = TRUE) %>%  # Emphasize the "Model" column
    save_kable("Coeff_table.html")