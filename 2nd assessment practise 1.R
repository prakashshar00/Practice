############################################################
# UNIT 8: CORRELATION AND REGRESSION ANALYSIS USING R
# This script includes:
# - Theory (commented)
# - 5 Questions (10 marks level)
# - Solutions with explanation
############################################################


############################################################
# THEORY SECTION
############################################################

# Correlation:
# Correlation measures the strength and direction of relationship
# between two variables.
# Range: -1 to +1
# +1 → perfect positive, -1 → perfect negative, 0 → no relation

# Pearson correlation coefficient formula:
# r = Cov(X,Y) / (sd(X)*sd(Y))

# Regression:
# Regression explains how dependent variable (Y) changes with X.

# Simple Linear Regression model:
# Y = a + bX + e
# where:
# a = intercept
# b = slope (coefficient)
# e = error term

# Assumptions of Linear Regression:
# 1. Linearity
# 2. Independence
# 3. Homoscedasticity (equal variance)
# 4. Normality of errors

# Hypothesis testing:
# t-test → individual coefficient
# F-test → overall model significance

# R-squared:
# Measures goodness of fit (0 to 1)

############################################################
# QUESTION 1 (INTRODUCTION TYPE)
############################################################

# Q1: Define correlation coefficient. Compute correlation 
# between study hours and marks.

study_hours <- c(2, 4, 6, 8, 10)
marks <- c(50, 55, 65, 70, 80)

correlation <- cor(study_hours, marks)
correlation

# Interpretation:
# High positive value → more study leads to higher marks


############################################################
# QUESTION 2 (WHAT HAPPENS & WHY TYPE)
############################################################

# Q2: What happens if correlation is zero? Why?

# Example data
x <- c(1,2,3,4,5)
y <- c(5,3,1,3,5)

cor(x,y)

# Explanation:
# Correlation ~ 0 means no linear relationship.
# But non-linear relationship may still exist.
# Hence correlation only measures linear relation.


############################################################
# QUESTION 3 (ILLUSTRATION TYPE - REGRESSION)
############################################################

# Q3: Fit a regression model and interpret coefficients

x <- c(1,2,3,4,5)
y <- c(2,4,5,4,5)

model <- lm(y ~ x)
summary(model)

# Interpretation:
# Intercept → value of Y when X=0
# Slope → change in Y per unit change in X


############################################################
# QUESTION 4 (HYPOTHESIS TESTING - t test & F test)
############################################################

# Q4: Test significance of regression model

summary(model)

# From summary:
# t-test → checks significance of slope
# p-value < 0.05 → significant

# F-test → overall model significance
# If p-value < 0.05 → model is useful


############################################################
# QUESTION 5 (PROJECT-BASED USING R STUDIO DATA ANALYSIS)
############################################################

# Q5: Perform full data analysis using built-in dataset

data(mtcars)

# Step 1: View data
head(mtcars)

# Step 2: Correlation matrix
cor(mtcars)

# Step 3: Regression model (mpg vs wt)
model2 <- lm(mpg ~ wt, data = mtcars)
summary(model2)

# Step 4: Plot
plot(mtcars$wt, mtcars$mpg,
     main="MPG vs Weight",
     xlab="Weight",
     ylab="MPG")
abline(model2, col="blue")

# Interpretation:
# Negative slope → heavier cars give lower mileage

############################################################
# EXTRA CONCEPT (STANDARDIZED vs UNSTANDARDIZED)
############################################################

# Unstandardized coefficient → actual units
# Standardized coefficient → unit-free (beta)

# Install package if needed:
# install.packages("lm.beta")

library(lm.beta)
lm.beta(model2)

############################################################
# END OF SCRIPT
############################################################

############################################################
# UNIT 8: COMPLETE CORRELATION & REGRESSION ANALYSIS
# (10 MARKS ANSWER - THEORY + PRACTICAL)
############################################################

############################################################
# THEORY (WRITE IN EXAM USING #)
############################################################

# Correlation:
# Correlation measures strength and direction of linear 
# relationship between two variables.
# Range: -1 to +1

# Regression:
# Regression explains how dependent variable (Y) changes 
# with independent variable (X)

# Model:
# Y = a + bX + e
# a = intercept, b = slope, e = error

############################################################
# STEP 1: LOAD DATA (PROJECT BASED ANALYSIS)
############################################################

data(mtcars)

# mpg = dependent variable (fuel efficiency)
# wt = independent variable (weight)

############################################################
# STEP 2: CORRELATION ANALYSIS
############################################################

cor(mtcars$mpg, mtcars$wt)

# Interpretation:
# Strong negative correlation → as weight increases,
# mileage decreases

############################################################
# STEP 3: TEST OF CORRELATION COEFFICIENT
############################################################

cor.test(mtcars$mpg, mtcars$wt)

# Hypothesis:
# H0: r = 0 (no relationship)
# H1: r ≠ 0 (relationship exists)

# If p-value < 0.05 → reject H0
# Conclusion: significant correlation exists

############################################################
# STEP 4: CORRELATION MATRIX
############################################################

cor(mtcars)

# Shows relationship among all variables

############################################################
# STEP 5: LINEAR REGRESSION MODEL
############################################################

model <- lm(mpg ~ wt, data = mtcars)
summary(model)

############################################################
# STEP 6: INTERPRETATION OF COEFFICIENTS
############################################################

# Intercept:
# Value of mpg when wt = 0 (not practical but theoretical)

# Slope (Unstandardized coefficient):
# Change in mpg for 1 unit increase in wt
# Usually negative → higher weight reduces mileage

############################################################
# STEP 7: STANDARDIZED COEFFICIENT
############################################################

# install.packages("lm.beta")
library(lm.beta)
lm.beta(model)

# Standardized coefficient:
# Used to compare importance of variables

############################################################
# STEP 8: HYPOTHESIS TESTING (t-test)
############################################################

# t-test checks individual coefficient significance
# From summary(model):

# H0: b = 0
# H1: b ≠ 0

# If p-value < 0.05 → coefficient is significant

############################################################
# STEP 9: OVERALL TEST (F-test)
############################################################

# F-test checks overall model significance

# H0: Model is not useful
# H1: Model is useful

# If p-value < 0.05 → model is significant

############################################################
# STEP 10: COEFFICIENT OF DETERMINATION (R²)
############################################################

summary(model)$r.squared

# Interpretation:
# % variation in mpg explained by wt

############################################################
# STEP 11: STANDARD ERROR
############################################################

summary(model)$sigma

# Measures accuracy of predictions

############################################################
# STEP 12: ASSUMPTIONS OF REGRESSION
############################################################

# 1. Linearity → relationship must be linear
# 2. Independence → observations independent
# 3. Homoscedasticity → constant variance
# 4. Normality → residuals normally distributed

############################################################
# CHECK ASSUMPTIONS (PLOTS)
############################################################

par(mfrow=c(2,2))
plot(model)

############################################################
# STEP 13: VISUALIZATION
############################################################

plot(mtcars$wt, mtcars$mpg,
     main="Regression Analysis",
     xlab="Weight",
     ylab="Mileage")

abline(model, col="blue")

############################################################
# FINAL CONCLUSION
############################################################

# There is a strong negative relationship between weight
# and mileage.
# Regression model is statistically significant.
# Weight is an important factor affecting fuel efficiency.

############################################################
# END
############################################################




############################################################
# UNIT 7: STATISTICAL INFERENCE USING R
# COMPLETE PROJECT-BASED SCRIPT (ALL TOPICS COVERED)
############################################################


############################################################
# THEORY SECTION (WRITE IN EXAM USING #)
############################################################

# Inferential Statistics:
# Used to draw conclusions about population using sample data

# Hypothesis Testing:
# H0 (Null Hypothesis): No effect / no difference
# H1 (Alternative): There is effect / difference

# Two approaches:
# 1. Critical value approach
# 2. P-value approach

# If p-value < 0.05 → Reject H0


############################################################
# PROJECT DATASET
############################################################

data(mtcars)

# mpg = mileage
# am = transmission (0 = automatic, 1 = manual)
# cyl = number of cylinders

############################################################
# 1. ONE SAMPLE t-TEST
############################################################

# Question:
# Test whether average mpg is equal to 20

t.test(mtcars$mpg, mu = 20)

# Interpretation:
# H0: mean mpg = 20
# If p-value < 0.05 → reject H0


############################################################
# 2. STUDENT t-DISTRIBUTION (CONCEPT)
############################################################

# Used when sample size is small and population variance unknown
# Automatically used in t.test()


############################################################
# 3. INDEPENDENT SAMPLE t-TEST
############################################################

# Compare mpg between automatic and manual cars

t.test(mpg ~ am, data = mtcars)

# H0: mean mpg same for both groups
# If p-value < 0.05 → difference exists


############################################################
# 4. PAIRED SAMPLE t-TEST
############################################################

# Example: before vs after values

before <- c(50, 55, 60, 65, 70)
after  <- c(55, 58, 63, 70, 75)

t.test(before, after, paired = TRUE)

# H0: no difference
# Used when same subjects are tested twice


############################################################
# 5. COMPARING TWO VARIANCES (F-TEST)
############################################################

# Compare variance of mpg between two groups

var.test(mpg ~ am, data = mtcars)

# H0: variances are equal
# If p-value < 0.05 → variances differ


############################################################
# 6. COMPARING THREE OR MORE MEANS (ANOVA - F TEST)
############################################################

# Compare mpg across different cylinder groups

anova_model <- aov(mpg ~ factor(cyl), data = mtcars)
summary(anova_model)

# H0: all group means are equal
# If p-value < 0.05 → at least one group differs


############################################################
# 7. CHI-SQUARE TEST (CONTINGENCY TABLE)
############################################################

# Create table: transmission vs cylinders

table_data <- table(mtcars$am, mtcars$cyl)
table_data

chisq.test(table_data)

# H0: variables are independent
# If p-value < 0.05 → variables are dependent


############################################################
# 8. CRITICAL VALUE APPROACH (MANUAL)
############################################################

# Example: qt() gives critical t-value

qt(0.975, df=length(mtcars$mpg)-1)

# Compare test statistic with critical value


############################################################
# 9. CONFIDENCE INTERVAL
############################################################

t.test(mtcars$mpg)$conf.int

# Gives range where true population mean lies


############################################################
# 10. VISUALIZATION FOR BETTER INTERPRETATION
############################################################

boxplot(mpg ~ am, data = mtcars,
        main="MPG by Transmission",
        xlab="Transmission",
        ylab="MPG")

############################################################
# FINAL CONCLUSION
############################################################

# - Mean mpg may differ across transmission types
# - Variance differences can be tested using F-test
# - ANOVA shows differences across multiple groups
# - Chi-square confirms dependency between categorical variables
# - Hypothesis testing helps in decision making

############################################################
# END OF PROJECT
############################################################



############################################################
# UNIT 7: STATISTICAL INFERENCE USING R
# QUESTION 2 (10 MARKS - FULL SOLUTION)
############################################################


############################################################
# THEORY SECTION
############################################################

# Statistical Inference:
# Making conclusions about population based on sample

# Hypothesis:
# H0: No difference / no effect
# H1: There is difference / effect

# Decision rules:
# p-value approach → p < 0.05 → reject H0
# critical value → compare test statistic with table value


############################################################
# DATASET (PROJECT BASED)
############################################################

data(iris)

# Sepal.Length used as main variable
# Species used for grouping


############################################################
# 1. ONE SAMPLE t-TEST
############################################################

# Test if mean Sepal.Length = 5.5

t.test(iris$Sepal.Length, mu = 5.5)

# Interpretation:
# If p < 0.05 → mean is significantly different


############################################################
# 2. INDEPENDENT SAMPLE t-TEST
############################################################

# Compare two species (setosa vs versicolor)

subset_data <- subset(iris, Species != "virginica")

t.test(Sepal.Length ~ Species, data = subset_data)

# H0: means are equal
# If p < 0.05 → significant difference


############################################################
# 3. PAIRED t-TEST
############################################################

# Example (same observation comparison)

x <- c(10,12,14,16,18)
y <- c(11,13,15,17,20)

t.test(x, y, paired = TRUE)

# Used when observations are related


############################################################
# 4. F-TEST (VARIANCE COMPARISON)
############################################################

var.test(Sepal.Length ~ Species, data = subset_data)

# H0: variances are equal
# If p < 0.05 → unequal variance


############################################################
# 5. ANOVA (COMPARING 3+ MEANS)
############################################################

anova_model <- aov(Sepal.Length ~ Species, data = iris)
summary(anova_model)

# H0: all species have same mean
# If p < 0.05 → at least one differs


############################################################
# 6. CHI-SQUARE TEST (INDEPENDENCE)
############################################################

# Create categorical grouping

table_data <- table(iris$Species, iris$Sepal.Width > 3)
table_data

chisq.test(table_data)

# H0: variables are independent
# If p < 0.05 → dependent


############################################################
# 7. CRITICAL VALUE APPROACH
############################################################

# Example t critical value

qt(0.975, df = nrow(iris)-1)

# Compare with calculated t-value from test


############################################################
# 8. CONFIDENCE INTERVAL
############################################################

t.test(iris$Sepal.Length)$conf.int

# Range where population mean lies


############################################################
# 9. VISUALIZATION
############################################################

boxplot(Sepal.Length ~ Species, data = iris,
        main="Sepal Length by Species",
        xlab="Species",
        ylab="Sepal Length")


############################################################
# FINAL CONCLUSION
############################################################

# - Mean differences exist among species
# - Variance differences may exist
# - ANOVA confirms group differences
# - Chi-square shows relationship between variables
# - Statistical inference helps decision making

############################################################
# END
############################################################

############################################################
# UNIT 5: GRAPHICS, VISUALIZATION & SUMMARY MEASURES
# COMPLETE PROJECT-BASED SCRIPT (10 MARKS)
############################################################


############################################################
# THEORY SECTION
############################################################

# Data Visualization:
# Graphical representation of data for better understanding

# Types:
# Bar chart, Pie chart, Histogram, Boxplot, Scatter plot, Line graph

# Summary Measures:
# Central tendency → mean, median, mode
# Variation → variance, standard deviation
# Shape → skewness, kurtosis


############################################################
# LOAD DATASET
############################################################

data(mtcars)


############################################################
# 1. BAR CHART
############################################################

barplot(table(mtcars$cyl),
        main="Number of Cars by Cylinders",
        col="lightblue")

############################################################
# 2. PIE CHART
############################################################

pie(table(mtcars$cyl),
    main="Cylinder Distribution")

############################################################
# 3. HISTOGRAM
############################################################

hist(mtcars$mpg,
     main="Histogram of MPG",
     col="lightgreen")

############################################################
# 4. BOX PLOT
############################################################

boxplot(mpg ~ cyl, data=mtcars,
        main="MPG by Cylinders")

############################################################
# 5. SCATTER PLOT
############################################################

plot(mtcars$wt, mtcars$mpg,
     main="Weight vs MPG",
     xlab="Weight", ylab="MPG")

############################################################
# 6. LINE GRAPH
############################################################

plot(mtcars$mpg, type="l",
     main="MPG Trend",
     ylab="MPG")

############################################################
# 7. DENSITY PLOT
############################################################

plot(density(mtcars$mpg),
     main="Density Plot of MPG")

############################################################
# 8. NORMAL Q-Q PLOT
############################################################

qqnorm(mtcars$mpg)
qqline(mtcars$mpg)

############################################################
# GGPlot (GRAMMAR OF GRAPHICS)
############################################################

# install.packages("ggplot2")
library(ggplot2)

# Histogram with density
ggplot(mtcars, aes(x=mpg)) +
  geom_histogram(aes(y=..density..), fill="blue") +
  geom_density(color="red")

# Scatter plot
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point() +
  geom_smooth(method="lm")

# Boxplot
ggplot(mtcars, aes(x=factor(cyl), y=mpg)) +
  geom_boxplot()

############################################################
# SUMMARY MEASURES
############################################################

# Central tendency
mean(mtcars$mpg)
median(mtcars$mpg)

# Variation
var(mtcars$mpg)
sd(mtcars$mpg)

############################################################
# SKEWNESS & KURTOSIS
############################################################

# install.packages("moments")
library(moments)

skewness(mtcars$mpg)
kurtosis(mtcars$mpg)

############################################################
# APPLY FAMILY FUNCTIONS
############################################################

# apply()
apply(mtcars, 2, mean)

# lapply()
lapply(mtcars, mean)

# sapply()
sapply(mtcars, mean)

############################################################
# DPLYR (SUMMARY & GROUPING)
############################################################

# install.packages("dplyr")
library(dplyr)

mtcars %>%
  group_by(cyl) %>%
  summarise(
    avg_mpg = mean(mpg),
    sd_mpg = sd(mpg)
  )

############################################################
# FINAL CONCLUSION
############################################################

# - Visualization helps understand data patterns
# - Histogram & density show distribution
# - Boxplot shows variation and outliers
# - Scatter plot shows relationships
# - Summary measures describe data numerically
# - dplyr helps in grouped analysis

############################################################
# END
############################################################

############################################################
# UNIT 5: GRAPHICS & SUMMARY MEASURES
# QUESTION 2 (10 MARKS FULL SOLUTION)
############################################################


############################################################
# THEORY SECTION
############################################################

# Univariate analysis → single variable (histogram, density)
# Multivariate analysis → multiple variables (scatter, boxplot)

# Central tendency → mean, median
# Dispersion → variance, standard deviation
# Shape → skewness, kurtosis


############################################################
# LOAD DATASET (iris)
############################################################

data(iris)


############################################################
# UNIVARIATE VISUALIZATION
############################################################

# Histogram
hist(iris$Sepal.Length,
     main="Histogram of Sepal Length",
     col="lightblue")

# Density plot
plot(density(iris$Sepal.Length),
     main="Density Plot")

# Q-Q plot
qqnorm(iris$Sepal.Length)
qqline(iris$Sepal.Length)


############################################################
# MULTIVARIATE VISUALIZATION
############################################################

# Scatter plot
plot(iris$Sepal.Length, iris$Petal.Length,
     main="Sepal vs Petal Length",
     xlab="Sepal Length", ylab="Petal Length")

# Boxplot
boxplot(Sepal.Length ~ Species, data=iris,
        main="Sepal Length by Species")

# Line graph (trend)
plot(iris$Sepal.Length, type="l",
     main="Trend of Sepal Length")


############################################################
# BAR & PIE CHART
############################################################

barplot(table(iris$Species),
        main="Count of Species")

pie(table(iris$Species),
    main="Species Distribution")


############################################################
# GGPLOT VISUALIZATION
############################################################

library(ggplot2)

# Histogram + density
ggplot(iris, aes(x=Sepal.Length)) +
  geom_histogram(aes(y=..density..), fill="green") +
  geom_density(color="red")

# Scatter with grouping
ggplot(iris, aes(x=Sepal.Length, y=Petal.Length, color=Species)) +
  geom_point()

# Boxplot
ggplot(iris, aes(x=Species, y=Sepal.Length)) +
  geom_boxplot()


############################################################
# SUMMARY MEASURES
############################################################

# Central tendency
mean(iris$Sepal.Length)
median(iris$Sepal.Length)

# Dispersion
var(iris$Sepal.Length)
sd(iris$Sepal.Length)

############################################################
# SKEWNESS & KURTOSIS
############################################################

library(moments)

skewness(iris$Sepal.Length)
kurtosis(iris$Sepal.Length)


############################################################
# APPLY FAMILY
############################################################

apply(iris[,1:4], 2, mean)
lapply(iris[,1:4], mean)
sapply(iris[,1:4], mean)


############################################################
# DPLYR GROUPED SUMMARY
############################################################

library(dplyr)

iris %>%
  group_by(Species) %>%
  summarise(
    mean_sepal = mean(Sepal.Length),
    sd_sepal = sd(Sepal.Length)
  )


############################################################
# FINAL INTERPRETATION
############################################################

# - Distribution of Sepal Length is approximately normal
# - Species differ in measurements (seen in boxplot)
# - Scatter plot shows relationship between variables
# - Summary measures describe central tendency & variation
# - dplyr simplifies grouped analysis

############################################################
# END
############################################################

############################################################
# PROBABILITY & PROBABILITY DISTRIBUTIONS USING R
# COMPLETE PROJECT-BASED SCRIPT (10 MARKS)
############################################################


############################################################
# THEORY SECTION
############################################################

# Probability:
# Measure of likelihood of an event (0 to 1)

# Random Number:
# Numbers generated without any predictable pattern

# Random Number Generator:
# In R → runif(), rnorm(), rbinom() etc.

# Sample:
# Subset of population used for analysis


############################################################
# 1. RANDOM NUMBER GENERATION
############################################################

# Uniform random numbers (0 to 1)
runif(10)

# Random numbers between 1 and 100
runif(10, min=1, max=100)

############################################################
# 2. SAMPLE SELECTION
############################################################

data <- 1:100

# Random sample of size 10
sample(data, 10)

# With replacement
sample(data, 10, replace=TRUE)


############################################################
# 3. BINOMIAL DISTRIBUTION
############################################################

# Example: 10 trials, probability = 0.5
rbinom(10, size=10, prob=0.5)

# Probability of getting exactly 5 successes
dbinom(5, size=10, prob=0.5)

# Plot
x <- 0:10
y <- dbinom(x, size=10, prob=0.5)

plot(x, y, type="h",
     main="Binomial Distribution",
     xlab="Successes", ylab="Probability")


############################################################
# 4. NEGATIVE BINOMIAL DISTRIBUTION
############################################################

# Number of failures before 5 successes
rnbinom(10, size=5, prob=0.5)

# Probability function
x <- 0:10
y <- dnbinom(x, size=5, prob=0.5)

plot(x, y, type="h",
     main="Negative Binomial Distribution")


############################################################
# 5. POISSON DISTRIBUTION
############################################################

# Average rate λ = 3
rpois(10, lambda=3)

# Probability
x <- 0:10
y <- dpois(x, lambda=3)

plot(x, y, type="h",
     main="Poisson Distribution")


############################################################
# 6. NORMAL DISTRIBUTION
############################################################

# Generate normal data
data_norm <- rnorm(100, mean=50, sd=10)

# Density function
x <- seq(20, 80, length=100)
y <- dnorm(x, mean=50, sd=10)

plot(x, y, type="l",
     main="Normal Distribution Curve")

############################################################
# 7. TESTING NORMALITY
############################################################

# Histogram
hist(data_norm, main="Histogram of Normal Data")

# Q-Q plot
qqnorm(data_norm)
qqline(data_norm)

# Shapiro-Wilk test
shapiro.test(data_norm)

# Interpretation:
# H0: data is normally distributed
# If p-value > 0.05 → data is normal


############################################################
# FINAL CONCLUSION
############################################################

# - Random numbers simulate real-world uncertainty
# - Binomial used for success/failure experiments
# - Negative binomial models failures before success
# - Poisson models rare events
# - Normal distribution models continuous data
# - Normality testing ensures correct statistical methods

############################################################
# END
############################################################

############################################################
# PROBABILITY & DISTRIBUTIONS USING R
# QUESTION 2 (10 MARKS FULL SOLUTION)
############################################################


############################################################
# THEORY SECTION
############################################################

# Probability distributions describe how values are distributed

# Discrete distributions:
# Binomial, Poisson

# Continuous distribution:
# Normal distribution

# Random sampling helps simulate real-world data


############################################################
# 1. RANDOM DATA GENERATION
############################################################

set.seed(123)

# Generate dataset
data <- rnorm(100, mean=50, sd=10)


############################################################
# 2. SAMPLING
############################################################

# Take sample of size 20
sample_data <- sample(data, 20)

# Compare mean
mean(data)
mean(sample_data)

# Interpretation:
# Sample mean approximates population mean


############################################################
# 3. BINOMIAL DISTRIBUTION
############################################################

# Example: 20 trials, p = 0.4
binom_data <- rbinom(100, size=20, prob=0.4)

hist(binom_data,
     main="Binomial Distribution",
     col="lightblue")

############################################################
# 4. POISSON DISTRIBUTION
############################################################

pois_data <- rpois(100, lambda=5)

hist(pois_data,
     main="Poisson Distribution",
     col="lightgreen")

############################################################
# 5. NORMAL DISTRIBUTION
############################################################

hist(data,
     main="Normal Distribution",
     col="pink")

# Density overlay
lines(density(data), col="blue")


############################################################
# 6. COMPARISON OF DISTRIBUTIONS
############################################################

par(mfrow=c(1,3))

hist(binom_data, main="Binomial")
hist(pois_data, main="Poisson")
hist(data, main="Normal")

# Interpretation:
# Binomial → discrete, fixed trials
# Poisson → rare events
# Normal → continuous bell shape


############################################################
# 7. NORMALITY TEST
############################################################

# Q-Q plot
qqnorm(data)
qqline(data)

# Shapiro test
shapiro.test(data)

# H0: data is normal
# If p > 0.05 → accept H0


############################################################
# 8. PROBABILITY CALCULATION
############################################################

# P(X ≤ 60)
pnorm(60, mean=50, sd=10)

# P(X = 5) in Poisson
dpois(5, lambda=5)

# P(X = 8 successes in Binomial
dbinom(8, size=20, prob=0.4)


############################################################
# FINAL CONCLUSION
############################################################

# - Sampling represents population
# - Distributions show different data behavior
# - Normal distribution is symmetric
# - Statistical tests confirm distribution type

############################################################
# END
############################################################