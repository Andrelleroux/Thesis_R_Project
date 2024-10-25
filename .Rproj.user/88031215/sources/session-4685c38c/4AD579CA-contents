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
    #gradients <- t(X) %*% errors
    W_new <- W + learning_rate * gradients
    diag(W_new) <- 0
    return(W_new)
}