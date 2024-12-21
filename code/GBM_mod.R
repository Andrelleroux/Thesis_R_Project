library(tidyverse)
library(tidymodels)
library(lightgbm)
library(dplyr)
library(bonsai)

GBM_mod <- function(){

    # Convert countrycode to a factor
    gdp_data <- Model_Data %>%
        mutate(countrycode = as.factor(countrycode))

    # Train-test split
    set.seed(123)  # For reproducibility
    data_split <- initial_split(gdp_data, prop = 0.8)
    train_data <- training(data_split)
    test_data <- testing(data_split)

    # Create a recipe for preprocessing
    recipe <- recipe(ln_Gdp ~ year + countrycode + hc + l_pop + l_cn, data = train_data) %>%
        step_dummy(all_nominal_predictors()) %>%  # Convert categorical variables to dummies
        step_normalize(all_numeric_predictors())  # Normalize numeric variables

    # Define a LightGBM model with tunable parameters
    gbm_model <- boost_tree(
        mode = "regression",
        trees = tune(),               # Number of trees
        tree_depth = tune(),          # Depth of the trees
        learn_rate = tune(),          # Learning rate
        loss_reduction = tune(),      # Minimum loss reduction (gamma in LightGBM)
        min_n = tune(),               # Minimum data in a leaf
        sample_size = tune()          # Subsample proportion
    ) %>%
        set_engine("lightgbm")

    workflow <- workflow() %>%
        add_recipe(recipe) %>%
        add_model(gbm_model)

    param_set <- parameters(gbm_model)

    grid <- grid_random(param_set, size = 500)

    # 5-fold cross-validation
    cv_folds <- vfold_cv(train_data, v = 10)

    # Tune the model
    set.seed(123)
    tuned_results <- tune_grid(
        workflow,
        resamples = cv_folds,
        grid = grid,
        metrics = metric_set(rmse)  # Evaluate using RMSE and R-squared
    )

    best_params <- select_best(tuned_results, metric = "rmse")

    # Finalize the workflow with the best parameters
    final_workflow <- finalize_workflow(workflow, best_params)

    # Fit the final model
    final_model <- fit(final_workflow, data = train_data)

    fitted_values_GBM <- Model_Data %>%
        mutate(fitted_GBM = as.numeric(unlist(predict(final_model, Model_Data)))) %>%
        select(countrycode, year, fitted_GBM)


    # Make predictions on the test set
    test_predictions <- predict(final_model, test_data) %>%
        bind_cols(test_data)

    # Evaluate the performance
    metrics <- test_predictions %>%
        metrics(truth = ln_Gdp, estimate = .pred)

    print(metrics)

    # Extract the fitted model
    fitted_model <- pull_workflow_fit(final_model)$fit

    # Get feature importance
    importance <- lgb.importance(fitted_model)

    # Plot the top features
    lgb.plot.importance(importance, top_n = 10)



}