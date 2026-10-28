# ============================================
# Lab 2 Assignment - Iris Dataset Analysis
# ============================================

# 1. Load Dataset
# Iris is a built-in dataset in R

data(iris)

# --------------------------------------------
# 2. Structure of Dataset
# --------------------------------------------

# Display structure
str(iris)

# Summary statistics
summary(iris)

# Interpretation:
# The dataset contains 150 observations and 5 variables.
# There are 4 numerical (continuous) variables:
# Sepal.Length, Sepal.Width, Petal.Length, Petal.Width
# And 1 categorical variable:
# Species (Setosa, Versicolor, Virginica)
# This dataset is commonly used for classification problems.

# --------------------------------------------
# 3. Barplot of Categorical Variable
# --------------------------------------------

species_count <- table(iris$Species)

barplot(species_count,
        main = "Barplot of Species",
        col = "lightblue",
        xlab = "Species",
        ylab = "Frequency")

# Interpretation:
# The barplot shows equal counts of all three species (50 each).
# This indicates that the dataset is balanced.

# --------------------------------------------
# 4. Boxplots of Continuous Variables
# --------------------------------------------

# Individual boxplots
boxplot(iris$Sepal.Length, main="Sepal Length", col="lightgreen")
boxplot(iris$Sepal.Width, main="Sepal Width", col="lightgreen")
boxplot(iris$Petal.Length, main="Petal Length", col="lightgreen")
boxplot(iris$Petal.Width, main="Petal Width", col="lightgreen")

# Grouped boxplot
boxplot(Sepal.Length ~ Species, data=iris,
        main="Sepal Length by Species",
        col=c("red","blue","green"))

# Interpretation:
# Boxplots show distribution, median, and outliers.
# Petal measurements vary significantly across species.
# Setosa has smaller values, Virginica has larger values.

# --------------------------------------------
# 5. Histograms using ggplot2
# --------------------------------------------

library(ggplot2)

ggplot(iris, aes(x=Sepal.Length)) +
  geom_histogram(fill="blue", bins=20) +
  ggtitle("Histogram of Sepal Length")

ggplot(iris, aes(x=Petal.Length)) +
  geom_histogram(fill="green", bins=20) +
  ggtitle("Histogram of Petal Length")

# Interpretation:
# Sepal Length is approximately normally distributed.
# Petal Length shows multiple peaks due to species differences.

# --------------------------------------------
# 6. Scatterplot Matrix
# --------------------------------------------

pairs(iris[,1:4], main="Scatterplot Matrix")

# Interpretation:
# Strong positive correlation between Petal Length and Petal Width.
# Setosa species is clearly separated from others.
# Some overlap exists between Versicolor and Virginica.

# --------------------------------------------
# 7. T-Test
# --------------------------------------------

# Comparing Sepal Length of Setosa and Versicolor

setosa <- iris$Sepal.Length[iris$Species=="setosa"]
versicolor <- iris$Sepal.Length[iris$Species=="versicolor"]

# Assumption 1: Normality
shapiro.test(setosa)
shapiro.test(versicolor)

# Assumption 2: Equal variance
var.test(setosa, versicolor)

# Perform t-test
t.test(setosa, versicolor, var.equal=TRUE)

# Interpretation:
# Null hypothesis: Means are equal.
# If p-value < 0.05, reject null hypothesis.
# This indicates significant difference in Sepal Length.

# --------------------------------------------
# 8. One-Way ANOVA
# --------------------------------------------

# Comparing Sepal Length across all species

# Assumption 1: Normality
shapiro.test(iris$Sepal.Length)

# Assumption 2: Homogeneity of variance
bartlett.test(Sepal.Length ~ Species, data=iris)

# Perform ANOVA
anova_model <- aov(Sepal.Length ~ Species, data=iris)
summary(anova_model)

# Post-hoc test
TukeyHSD(anova_model)

# Interpretation:
# Null hypothesis: All group means are equal.
# If p-value < 0.05, at least one group differs.
# Tukey test shows which specific groups differ.

# ============================================
# END OF SCRIPT
# ============================================


# ==========================================================
# LAB ASSIGNMENT - ADVANCED STATISTICAL ANALYSIS IN R
# ==========================================================

# ----------------------------------------------------------
# 4. BINOMIAL DISTRIBUTION
# ----------------------------------------------------------

# Define number of trials
n <- 30

# Define probability of success (assume p = 0.5)
p <- 0.5

# Define success values from 0 to 30
x <- 0:30

# Calculate binomial probabilities
binom_prob <- dbinom(x, size = n, prob = p)

# Display probabilities
binom_prob

# Plot the probabilities
plot(x, binom_prob, type="h",
     main="Binomial Distribution (n=30, p=0.5)",
     xlab="Number of Successes",
     ylab="Probability",
     col="blue")

# Interpretation:
# The binomial distribution shows probability of different success counts.
# Since p = 0.5, the distribution is symmetric around 15.
# Highest probability occurs near the mean (np = 15).
# Extreme values (0 or 30) have very low probability.
# This demonstrates how outcomes cluster around expected value.

# ----------------------------------------------------------
# 5. LINEAR REGRESSION + MULTICOLLINEARITY (mpg dataset)
# ----------------------------------------------------------

library(ggplot2)

# Load dataset
data(mpg)

# View structure
str(mpg)

# Dependent variable: cty (city mileage)

# Convert categorical variables to factors if needed
mpg$manufacturer <- as.factor(mpg$manufacturer)
mpg$model <- as.factor(mpg$model)
mpg$trans <- as.factor(mpg$trans)
mpg$drv <- as.factor(mpg$drv)
mpg$fl <- as.factor(mpg$fl)
mpg$class <- as.factor(mpg$class)

# Fit regression models one by one
variables <- names(mpg)
variables <- variables[variables != "cty"]

significant_vars <- c()

for (var in variables) {
  formula <- as.formula(paste("cty ~", var))
  model <- lm(formula, data=mpg)
  p_val <- summary(model)$coefficients[2,4]
  
  if (!is.na(p_val) && p_val < 0.05) {
    significant_vars <- c(significant_vars, var)
  }
}

# Show significant variables
significant_vars

# Interpretation:
# Variables with p < 0.05 are statistically significant.
# These variables influence city mileage.

# ---------------------------------------
# Check Multicollinearity using VIF
# ---------------------------------------

library(car)

# Create full model with significant variables
formula_full <- as.formula(
  paste("cty ~", paste(significant_vars, collapse="+"))
)

model_full <- lm(formula_full, data=mpg)

# Calculate VIF
vif_values <- vif(model_full)
vif_values

# Iteratively remove variables with highest VIF > 10
while(max(vif_values) > 10){
  var_remove <- names(which.max(vif_values))
  significant_vars <- significant_vars[significant_vars != var_remove]
  
  formula_full <- as.formula(
    paste("cty ~", paste(significant_vars, collapse="+"))
  )
  
  model_full <- lm(formula_full, data=mpg)
  vif_values <- vif(model_full)
}

# Final model
final_model <- model_full
summary(final_model)
vif(final_model)

# Interpretation:
# VIF < 10 indicates no serious multicollinearity.
# Final model is BLUE (Best Linear Unbiased Estimator).

# ---------------------------------------
# LINE Assumptions Check
# ---------------------------------------

# 1. Linearity
plot(final_model$fitted.values, final_model$residuals,
     main="Residual vs Fitted")
abline(h=0)

# 2. Normality
qqnorm(final_model$residuals)
qqline(final_model$residuals)

# 3. Homoscedasticity
plot(final_model$residuals,
     main="Residual Plot")

# Interpretation:
# Residuals should be randomly scattered → linearity holds
# QQ plot should follow straight line → normality holds
# Constant spread → homoscedasticity holds

# ----------------------------------------------------------
# 6. TRAIN-TEST SPLIT + MODEL EVALUATION
# ----------------------------------------------------------

set.seed(123)  # Replace 123 with your roll number

# Split data (70:30)
sample_size <- floor(0.7 * nrow(mpg))
train_index <- sample(seq_len(nrow(mpg)), size = sample_size)

train_data <- mpg[train_index, ]
test_data <- mpg[-train_index, ]

# Fit model (dependent variable: hwy)
model_train <- lm(hwy ~ ., data=train_data)

summary(model_train)

# Predictions on training data
train_pred <- predict(model_train, train_data)

# Accuracy metrics (Training)
train_rmse <- sqrt(mean((train_data$hwy - train_pred)^2))
train_r2 <- cor(train_data$hwy, train_pred)^2

train_rmse
train_r2

# Predictions on testing data
test_pred <- predict(model_train, test_data)

# Accuracy metrics (Testing)
test_rmse <- sqrt(mean((test_data$hwy - test_pred)^2))
test_r2 <- cor(test_data$hwy, test_pred)^2

test_rmse
test_r2

# Interpretation:
# Compare training and testing performance

# If:
# Train accuracy >> Test accuracy → Overfitting
# Train ≈ Test → Good model
# Both low → Underfitting

# Likely Interpretation:
# If test RMSE is much higher than training RMSE → Overfitting
# Model memorizes training data but performs poorly on new data

# ---------------------------------------
# Model Improvement Suggestions
# ---------------------------------------

# Interpretation:
# Model can be improved by:
# 1. Removing irrelevant variables
# 2. Using feature selection techniques
# 3. Applying regularization (Ridge/Lasso)
# 4. Transforming variables
# 5. Increasing dataset size

# ==========================================================
# END OF SCRIPT
# ==========================================================

# ==========================================================
# MASTER SCRIPT: STATISTICS + PROBABILITY + REGRESSION IN R
# ==========================================================

# ----------------------------------------------------------
# 1. PROBABILITY DISTRIBUTIONS
# ----------------------------------------------------------

# THEORY:
# A probability distribution describes how probabilities are distributed
# over values of a random variable.

# Types:
# 1. Discrete (Binomial, Poisson)
# 2. Continuous (Normal, Exponential)

# ---------------------------------------
# BINOMIAL DISTRIBUTION
# ---------------------------------------

# THEORY:
# Used when:
# - Fixed number of trials (n)
# - Two outcomes (success/failure)
# - Constant probability (p)
# Formula: P(X=x) = nCx * p^x * (1-p)^(n-x)

n <- 10
p <- 0.5
x <- 0:10

prob <- dbinom(x, n, p)

plot(x, prob, type="h", main="Binomial Distribution")

# INTERPRETATION:
# Symmetric if p = 0.5
# Mean = np, Variance = np(1-p)

# ---------------------------------------
# NORMAL DISTRIBUTION
# ---------------------------------------

# THEORY:
# Bell-shaped continuous distribution
# Mean = median = mode
# Defined by mean and standard deviation

x <- seq(-3, 3, length=100)
y <- dnorm(x, mean=0, sd=1)

plot(x, y, type="l", main="Normal Distribution")

# INTERPRETATION:
# Most values near mean, tails decrease gradually

# ---------------------------------------
# POISSON DISTRIBUTION
# ---------------------------------------

# THEORY:
# Used for count data (events in fixed interval)
# Mean = Variance = lambda

x <- 0:10
lambda <- 3
y <- dpois(x, lambda)

plot(x, y, type="h", main="Poisson Distribution")

# ----------------------------------------------------------
# 2. COVARIANCE & CORRELATION
# ----------------------------------------------------------

# THEORY:
# Covariance: Measures direction of relationship
# Correlation: Standardized covariance (-1 to +1)

data(mtcars)

cov(mtcars$mpg, mtcars$hp)
cor(mtcars$mpg, mtcars$hp)

# INTERPRETATION:
# Negative correlation → inverse relationship
# Positive correlation → direct relationship

# ----------------------------------------------------------
# 3. REGRESSION ANALYSIS
# ----------------------------------------------------------

# THEORY:
# Regression predicts dependent variable using independent variables

# Simple Linear Regression:
# y = a + bx

model <- lm(mpg ~ hp, data=mtcars)
summary(model)

# INTERPRETATION:
# Coefficient shows effect of hp on mpg
# p-value < 0.05 → significant variable
# R² shows model fit

# ---------------------------------------
# MULTIPLE LINEAR REGRESSION
# ---------------------------------------

model2 <- lm(mpg ~ hp + wt + cyl, data=mtcars)
summary(model2)

# ----------------------------------------------------------
# 4. CURVE FITTING
# ----------------------------------------------------------

# THEORY:
# Curve fitting is used when relationship is non-linear

# Polynomial Regression

model_poly <- lm(mpg ~ poly(hp, 2), data=mtcars)
summary(model_poly)

# INTERPRETATION:
# Captures curved relationship

# ----------------------------------------------------------
# 5. STATISTICAL TESTING
# ----------------------------------------------------------

# THEORY:
# Hypothesis testing:
# H0 (Null hypothesis)
# H1 (Alternative hypothesis)

# ---------------------------------------
# T-TEST
# ---------------------------------------

# THEORY:
# Compare means of two groups

t.test(mpg ~ am, data=mtcars)

# ASSUMPTIONS:
# 1. Normality
# 2. Equal variance
# 3. Independent samples

shapiro.test(mtcars$mpg)
var.test(mpg ~ am, data=mtcars)

# INTERPRETATION:
# p < 0.05 → reject H0

# ---------------------------------------
# ANOVA
# ---------------------------------------

# THEORY:
# Compare means of more than 2 groups

anova_model <- aov(mpg ~ factor(cyl), data=mtcars)
summary(anova_model)

# ASSUMPTIONS:
# 1. Normality
# 2. Homogeneity of variance

bartlett.test(mpg ~ factor(cyl), data=mtcars)

# INTERPRETATION:
# p < 0.05 → at least one group differs

# ---------------------------------------
# CHI-SQUARE TEST
# ---------------------------------------

# THEORY:
# Tests association between categorical variables

tbl <- table(mtcars$cyl, mtcars$gear)
chisq.test(tbl)

# ----------------------------------------------------------
# 6. MODEL DIAGNOSTICS (LINE ASSUMPTIONS)
# ----------------------------------------------------------

# THEORY:
# L → Linearity
# I → Independence
# N → Normality
# E → Equal variance (Homoscedasticity)

model <- lm(mpg ~ hp, data=mtcars)

# Linearity
plot(model$fitted.values, model$residuals)
abline(h=0)

# Normality
qqnorm(model$residuals)
qqline(model$residuals)

# Homoscedasticity
plot(model$residuals)

# ----------------------------------------------------------
# 7. MULTICOLLINEARITY (VIF)
# ----------------------------------------------------------

library(car)

model <- lm(mpg ~ hp + wt + disp, data=mtcars)
vif(model)

# THEORY:
# VIF > 10 → serious multicollinearity

# ----------------------------------------------------------
# 8. MODEL FITTING (UNDER / OVER FITTING)
# ----------------------------------------------------------

# THEORY:
# Underfitting → poor model (low accuracy)
# Overfitting → too complex (bad on new data)
# Good fit → balanced

set.seed(123)

sample_size <- floor(0.7 * nrow(mtcars))
train <- sample(seq_len(nrow(mtcars)), size=sample_size)

train_data <- mtcars[train, ]
test_data <- mtcars[-train, ]

model <- lm(mpg ~ ., data=train_data)

train_pred <- predict(model, train_data)
test_pred <- predict(model, test_data)

train_rmse <- sqrt(mean((train_data$mpg - train_pred)^2))
test_rmse <- sqrt(mean((test_data$mpg - test_pred)^2))

train_rmse
test_rmse

# INTERPRETATION:
# If test RMSE >> train RMSE → Overfitting
# If both high → Underfitting
# If similar → Good model

# ----------------------------------------------------------
# POSSIBLE EXAM QUESTIONS (IMPORTANT)
# ----------------------------------------------------------

# 1. Explain binomial distribution with example
# 2. Difference between covariance and correlation
# 3. What is regression? Interpret coefficients
# 4. What is multicollinearity? How to detect (VIF)
# 5. Explain LINE assumptions
# 6. Difference between t-test and ANOVA
# 7. What is overfitting and underfitting?
# 8. How to improve model performance?

# ----------------------------------------------------------
# TESTING IDEAS (VERY IMPORTANT FOR EXAM)
# ----------------------------------------------------------

# Always follow steps:
# 1. Define hypothesis (H0, H1)
# 2. Check assumptions
# 3. Perform test
# 4. Compare p-value with 0.05
# 5. Interpret result

# ==========================================================
# END OF MASTER SCRIPT
# ==========================================================
