
data_long <- plot_df %>%
    pivot_longer(cols = c(starts_with("fitted")),
                 names_to = "Model",
                 values_to = "Predicted_GDP") %>%
    mutate(MAPE = abs((ln_Gdp - Predicted_GDP) / ln_Gdp) * 100) %>%
    filter(countrycode == "VEN")

ggplot(data_long, aes(x = year)) +
    geom_line(aes(y = MAPE, color = "MAPE"), size = 1) +
    facet_wrap(~ Model) +
    labs(
        title = "MAPE of Actual and Predicted GDP",
        x = "Time",
        y = "MAPE",
        color = "Legend"
    ) +
    theme_minimal() +
    theme(legend.position = "bottom")


data_long2 <- plot_df %>%
    pivot_longer(cols = c(starts_with("fitted")),
                 names_to = "Model",
                 values_to = "Predicted_GDP") %>%
    group_by(countrycode, Model) %>%
    summarise( MAPE = mean(abs((ln_Gdp - Predicted_GDP) / ln_Gdp) * 100, na.rm = TRUE))

ggplot(data_long2, aes(x = countrycode, y = MAPE, fill = Model)) +
    geom_bar(stat = "identity", position = position_dodge(width = 0.8), alpha = 0.9) +
    facet_wrap(~ Model, scales = "free_y") +
    labs(
        title = "Average MAPE Scores for Each Country by Model",
        x = "Country",
        y = "MAPE (%)",
        fill = "Model"
    ) +
    theme_minimal() +
    theme(
        axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "bottom"
    )


