############################################################
# Q5 & Q6: LINEAR REGRESSION, MULTICOLLINEARITY, TRAIN-TEST
# DATASET: mpg (ggplot2)
############################################################


############################################################
# LOAD LIBRARIES
############################################################

library(ggplot2)
library(dplyr)
library(car)        # for VIF
library(caret)      # for data split

############################################################
# LOAD DATA
############################################################

data(mpg)

############################################################
# DATA PREPROCESSING
############################################################

# Convert categorical variables to factors
mpg$manufacturer <- as.factor(mpg$manufacturer)
mpg$model <- as.factor(mpg$model)
mpg$trans <- as.factor(mpg$trans)
mpg$drv <- as.factor(mpg$drv)
mpg$fl <- as.factor(mpg$fl)
mpg$class <- as.factor(mpg$class)


############################################################
# ==========================================================
# Q5: REGRESSION WITH MULTICOLLINEARITY CHECK (cty as DV)
# ==========================================================
############################################################

############################################################
# STEP 1: FIT MODELS ONE BY ONE
############################################################

vars <- names(mpg)
vars <- vars[vars != "cty"]

significant_vars <- c()

for (v in vars) {
  formula <- as.formula(paste("cty ~", v))
  model <- lm(formula, data = mpg)
  p_val <- summary(model)$coefficients[2,4]
  
  if (!is.na(p_val) && p_val < 0.05) {
    significant_vars <- c(significant_vars, v)
  }
}

significant_vars


############################################################
# STEP 2: MULTIPLE REGRESSION WITH SIGNIFICANT VARIABLES
############################################################

formula_full <- as.formula(
  paste("cty ~", paste(significant_vars, collapse = "+"))
)

model_full <- lm(formula_full, data = mpg)
summary(model_full)


############################################################
# STEP 3: CHECK MULTICOLLINEARITY (VIF)
############################################################

vif(model_full)


############################################################
# STEP 4: REMOVE VARIABLES WITH HIGH VIF (>10)
############################################################

model_refined <- model_full

repeat {
  vif_values <- vif(model_refined)
  max_vif <- max(vif_values)
  
  if (max_vif < 10) break
  
  remove_var <- names(which.max(vif_values))
  significant_vars <- significant_vars[significant_vars != remove_var]
  
  formula_new <- as.formula(
    paste("cty ~", paste(significant_vars, collapse = "+"))
  )
  
  model_refined <- lm(formula_new, data = mpg)
}

summary(model_refined)
vif(model_refined)


############################################################
# STEP 5: BLUE ASSUMPTIONS CHECK
############################################################

par(mfrow=c(2,2))
plot(model_refined)

# Interpretation (write in exam):
# 1. Linearity → residual vs fitted plot random
# 2. Homoscedasticity → no funnel shape
# 3. Normality → Q-Q plot straight line
# 4. Independence → no pattern


############################################################
# FINAL MODEL (BLUE MODEL)
############################################################

model_refined


############################################################
# INTERPRETATION (WRITE IN EXAM)
############################################################

# - Significant variables affect city mileage
# - Multicollinearity removed using VIF
# - Final model satisfies VIF < 10 → stable estimates
# - Residual plots confirm BLUE assumptions approximately satisfied
# - Model is statistically valid


############################################################
# ==========================================================
# Q6: TRAIN-TEST SPLIT & MODEL EVALUATION (hwy as DV)
# ==========================================================
############################################################

############################################################
# STEP 1: TRAIN-TEST SPLIT (70:30)
############################################################

set.seed(123)   # replace 123 with your roll number

trainIndex <- createDataPartition(mpg$hwy, p=0.7, list=FALSE)

train_data <- mpg[trainIndex, ]
test_data  <- mpg[-trainIndex, ]


############################################################
# STEP 2: FIT MODEL ON TRAINING DATA
############################################################

model_train <- lm(hwy ~ ., data=train_data)
summary(model_train)


############################################################
# STEP 3: TRAINING ACCURACY
############################################################

pred_train <- predict(model_train, train_data)

RMSE_train <- sqrt(mean((train_data$hwy - pred_train)^2))
R2_train <- cor(train_data$hwy, pred_train)^2

RMSE_train
R2_train


############################################################
# STEP 4: TESTING ACCURACY
############################################################

pred_test <- predict(model_train, test_data)

RMSE_test <- sqrt(mean((test_data$hwy - pred_test)^2))
R2_test <- cor(test_data$hwy, pred_test)^2

RMSE_test
R2_test


############################################################
# STEP 5: MODEL DIAGNOSIS
############################################################

# Compare train vs test

RMSE_train
RMSE_test

R2_train
R2_test


############################################################
# INTERPRETATION (WRITE IN EXAM)
############################################################

# CASES:

# 1. Underfitting:
# Train & Test both low accuracy → model too simple

# 2. Overfitting:
# Train accuracy high, Test accuracy low → model too complex

# 3. Good Fit:
# Train & Test accuracy similar → balanced model


############################################################
# IMPROVEMENT METHODS
############################################################

# - Remove irrelevant variables
# - Use feature selection
# - Apply regularization (Ridge/Lasso)
# - Transform variables
# - Increase sample size


############################################################
# FINAL CONCLUSION
############################################################

# - Model built using training data predicts highway mileage
# - Accuracy comparison determines model quality
# - Balanced RMSE and R² indicate good model performance
# - Further improvement possible using advanced techniques

############################################################
# END
############################################################