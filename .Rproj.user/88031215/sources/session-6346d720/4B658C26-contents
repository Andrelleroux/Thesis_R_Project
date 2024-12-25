
library(mlr)
library(mlrMBO)
library(lightgbm)
library(tidyverse)
library(gbm)
library(DiceKriging)
library(parallelMap)
library(rsample)

gdp_data <- Model_Data_TWFE %>%
    mutate(countrycode = as.factor(countrycode))

# Train-test split
set.seed(123)  # For reproducibility
data_split <- initial_split(gdp_data, prop = 0.8)
train_data <- training(data_split)
test_data <- testing(data_split)

# Step 1: Define the task
task <- makeRegrTask(data = train_data, target = "ln_Gdp")

# Step 2: Set up the GBM learner with tunable parameters
learner <- makeLearner(
    "regr.gbm",
    predict.type = "response"
)

getParamSet(learner)

# Step 3: Define the parameter space
param_space <- makeParamSet(
    makeIntegerParam("n.trees", lower = 10, upper = 500),
    makeIntegerParam("interaction.depth", lower = 1, upper = 15),
    makeIntegerParam("n.minobsinnode", lower = 5, upper = 50),
    makeNumericParam("shrinkage", lower = 0.01, upper = 0.3)
)

# Step 4: Set up resampling strategy for evaluation
resampling <- makeResampleDesc("CV", iters = 10)  # 10-fold cross-validation

# Step 5: Define the Bayesian optimization control
control <- makeMBOControl()
control <- setMBOControlTermination(control, exec.time.budget = 300L, iters = 50L)  # Max 50 iterations
control <- setMBOControlInfill(control, crit = makeMBOInfillCritEI())  # Use Expected Improvement

# Step 6: Set up the tuning wrapper
tune_wrapper <- makeTuneWrapper(
    learner = learner,
    resampling = resampling,
    measures = rmse,
    par.set = param_space,
    control = makeTuneControlMBO(mbo.control = control)
)

#parallelMap::parallelStartSocket(cpus = 6, logging = T)


# Step 7: Perform optimization
optimized_model <- tuneParams(
    tune_wrapper,
    task = task,
    resampling = resampling,
    par.set = param_space,
    control = makeTuneControlMBO(mbo.control = control),
    measures = rmse
)

final_learner <- setHyperPars(learner, par.vals = list(
    n.trees = 490,
    interaction.depth = 15,
    n.minobsinnode = 5,
    shrinkage = 0.111))

final_model <- mlr::train(final_learner, task)

# Step 8: Train the final model with optimal hyperparameters
final_learner <- setHyperPars(learner, par.vals = optimized_model$x)
final_model <- train(final_learner, task)

# Step 9: Evaluate on the test data
Model_Data_mlrMBO <- Model_Data %>%
    mutate(countrycode = as.factor(countrycode))

predict_train_mlrMBO <- predict(final_model, newdata = Model_Data_mlrMBO)
fitted_values_mlrMBO <- predict_train_mlrMBO$data$response %>%
    cbind(Model_Data_mlrMBO) %>%
    rename("fitted_GBM" = ".") %>%
    mutate(countrycode = as.character(countrycode)) %>%
    select(countrycode, year, ln_Gdp, fitted_GBM)

predictions <- predict(final_model, newdata = test_data)
performance_GBM <- performance(predictions, measures = rmse)

print(performance_GBM)
