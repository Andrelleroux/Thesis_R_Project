library(tidyverse)
library(caret)
library(matrixStats)

reshaped_data <- Model_Data %>% select(countrycode, ln_Gdp, year)%>%
    pivot_wider(names_from = countrycode, values_from = ln_Gdp) %>%
    arrange(year)

ReLU <- function(x) {
    return(pmax(0, x))
}

MSE <- function(actual, predicted) {
    return(mean((actual - predicted)^2))
}

Init_w <- function(n_countries) {
    W <- matrix(rnorm(n_countries^2, mean = 0, sd = sqrt(2 / n_countries)), nrow = n_countries, ncol = n_countries)
    diag(W) <- 0
    return(W)
}

Predict_GDP <- function(W, X) {
    predictions <- ReLU(X %*% W)
    return(predictions)
}

backpropagation <- function(W, X, Y, learning_rate = 0.01) {
    predictions <- Predict_GDP(W, X)
    errors <- Y - predictions
    gradients <- t(X) %*% errors
    W_new <- W + learning_rate * gradients
    diag(W_new) <- 0
    return(W_new)
}

cross_validation <- function(X, Y, n_folds = 10, epochs = 100, learning_rate = 0.01) {
    # Setup cross-validation
    folds <- createFolds(1:nrow(X), k = n_folds, list = TRUE)

    fold_mse <- c()

    for (fold in folds) {
        # Split data into training and testing sets
        train_index <- setdiff(1:nrow(X), fold)
        test_index <- fold

        X_train <- X[train_index, ]
        Y_train <- Y[train_index, ]

        X_test <- X[test_index, ]
        Y_test <- Y[test_index, ]

        # Initialize weights
        W <- initialize_weights(ncol(X))

        # Training loop
        for (epoch in 1:epochs) {
            W <- backpropagation(W, X_train, Y_train, learning_rate)
        }

        # After training, evaluate the model on the test set
        predictions <- forward_pass(W, X_test)
        fold_mse <- c(fold_mse, mse(Y_test, predictions))
    }

    # Return average MSE across folds
    return(predictions)
}

Backprop_Pred <- cross_validation(Comb_data, Pred_data, n_folds = 10, epochs = 100, learning_rate = 0.01)