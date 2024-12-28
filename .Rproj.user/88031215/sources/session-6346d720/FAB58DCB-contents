library(stargazer)
library(knitr)
library(kableExtra)
library(webshot2)
library(magick)

data_long_tab <- plot_df %>%
    pivot_longer(cols = c(starts_with("fitted")),
                 names_to = "Model",
                 values_to = "Predicted_GDP") %>%
    mutate(MAPE = abs((ln_Gdp - Predicted_GDP) / ln_Gdp) * 100) %>%
    group_by(Model) %>%
    summarise(Model_MAPE = mean(MAPE, na.rm = TRUE), .groups = "drop")

rmse_table <- data.frame(
    Model = c( "Two-Way Fixed Effects", "OLS" ,"ARIMA","Gradient Boosting Machine (GBM)", "Ensemble"),
    RMSE = c( Two_Way_RMSE ,OLS_RMSE, ARIMA_RMSE, performance_GBM, performance_Ens),
    MAPE = c(1.4452, 7.0575, 1.2320, 0.1799, 0.1154)
)

rmse_table %>%
    kbl(
        caption = "Root Mean Squared Errors (RMSE) of Models",
        col.names = c("Model", "RMSE", "MAPE"),
        align = "lc",  # Align columns (left and center)
        booktabs = TRUE  # Use LaTeX-style professional rules
    ) %>%
    kable_styling(
        bootstrap_options = c("striped", "hover", "condensed"),  # Add striped rows and hover effect
        full_width = FALSE,  # Keep the table compact
        font_size = 12       # Adjust font size
    ) %>%
    row_spec(0, bold = TRUE, color = "white", background = "black") %>%  # Style the header row
    column_spec(1, width = "4cm", bold = TRUE) %>%  # Emphasize the "Model" column
    column_spec(2, width = "3cm") %>%
    column_spec(3, width = "3cm") %>%
    save_kable("rmse_table.html")

Hyper_table <- data.frame(
    Hyperparameters = c("Number of Trees", "Depth of Trees", "Minimum Observations", "Shrinkage"),
    General_GBM = c(as.integer(c(490, 15, 5)), 0.111),
    Ensemble_GBM = c(as.integer(c(422, 15, 5)), 0.0527)
)

Hyper_table %>%
    kbl(
        caption = "Optimal Hyperparameters of GBM models",
        col.names = c("Hyperparameters", "General GBM", "Ensemble GBM"),
        align = "lc",  # Align columns (left and center)
        booktabs = TRUE  # Use LaTeX-style professional rules
    ) %>%
    kable_styling(
        bootstrap_options = c("striped", "hover", "condensed"),  # Add striped rows and hover effect
        full_width = FALSE,  # Keep the table compact
        font_size = 12       # Adjust font size
    ) %>%
    row_spec(0, bold = TRUE, color = "white", background = "black") %>%  # Style the header row
    column_spec(1, width = "6cm", bold = TRUE) %>%  # Emphasize the "Model" column
    column_spec(2, width = "3cm") %>%
    column_spec(3, width = "3cm") %>%
    save_kable("Hyper_table.html")

