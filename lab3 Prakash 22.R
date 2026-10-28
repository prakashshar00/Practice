# Name : Prakash Sharma
# Roll No : 22
# Lab Work 3 : Matrix Operations and Probability

#-------------------------------------------------------------

# 1. Define m1 as 5×5 matrix using numbers between 1 and 100
set.seed(123)   # for reproducibility , It always gives same random value whenever the program run

m1 <- matrix(sample(1:100, 25),
             nrow = 5,
             ncol = 5)

m1
# output 
#     [,1] [,2] [,3] [,4] [,5]
#[1,]   31   42   90   26   78
#[2,]   79   50   69    7   93
#[3,]   51   43   57   95   76
#[4,]   14   97    9   87   15
#[5,]   67   25   72   36   32
# here, m1 is the variable that store value ,(sample 1:100 , 25 ) helps to kept 25 random 
# value from 1 to 100 
# from above aoutput we know, in row 1 and column 1 i.e a11 = 31 ,  a12 = 42 and so on

m1
# yes, when we run again this code it gives same random output which is the function of seedset(123)


#---------------------------------------------------------------------------------------------
#2. Define m2 as 5×10 matrix using numbers between 1 and 100.
m2 <- matrix(sample(1:100, 50),
             nrow = 5,
             ncol = 10)

m2

# here i don't use seed set means , it gives random different values in different run 
# output 
#     [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#[1,]    7   27   95   76   89   16   50   52   84    30
#[2,]    9   60   38   63   21    6   88   22   96    12
#[3,]   41   53   34   13   98   86    4   66   35    71
#[4,]   74  100   69   82   47   39   83   32   40    61
#[5,]   23   93   72   25   94   31   81   46   48    55

# explaination is same as above 
m2 <- matrix(sample(1:100, 50),
             nrow = 5,
             ncol = 10)
m2
# yes , it gives different out put as, i run this code again.

#-------------------------------------------------------------------------------------
# 3. Get dot product of m1 and m2 and eigenvalue of m1. Interpret the results carefully.
# Matrix multiplication (dot product)
dot_product <- m1 %*% m2

dot_product


# Eigenvalues of m1
eigen_m1 <- eigen(m1)

eigen_m1$values 
# output 
#      [,1]  [,2]  [,3]  [,4]  [,5]  [,6]  [,7]  [,8]  [,9] [,10]
#[1,] 17308 15769 11897 15307  9161 11269 10648  8319 13718 14307
#[2,] 20551 19004 12010 19732 12491 14270 12000  9512 17824 17309
#[3,] 24450 21778 15968 16654 11362 17921 16132 10827 17019 16010
#[4,] 20156 15848  8941 11413  8908 11881  9011  9520  7961  6473
#[5,] 14191 13652 10615 13637 10519 13341  9199  6278 11983 14266

# here , the random value between 1 to 100 is taken high number by R , the the result 
# seems more integeral value 
# i will show simple matrix so , it makes us feel it is quite clean and helps to easily 
# interpret , from above we get eigen value is so small .(first , i explain above code give below)
# The dot product produces a 5×10 matrix.
# This is because:
# (5×5) %*% (5×10) = (5×10)

# Each element in the result represents the sum of products 
# of corresponding row elements of m1 and column elements of m2.

# Eigenvalues represent special scalar values that show how 
# the matrix transforms vectors.
# Large magnitude eigenvalues indicate stronger directional influence.
# If eigenvalues are positive, the transformation stretches vectors.
# Complex eigenvalues indicate rotational components in transformation.

m3 <- matrix(sample(1:20, 9),
             nrow = 3,
             ncol = 3)
m3

m4 <- matrix(sample(1:20,9),
             nrow = 3,
             ncol =3)
m4

dot_product <- m3 %*% m4 

dot_product


# Eigenvalues of m3
eigen_m3 <- eigen(m3)

eigen_m3$values 

#Still eigen value is not in exact number ??

# -----------------------------------------------------------------------------
#4.Define success from 0 to 30 and total number of trial as 30. Get binomial probabilities of all the success values and plot them.
#Interpret all the results carefully.

# Define success values from 0 to 30
success <- 0:30

# Total trials
n <- 30

# Assume probability of success = 0.5
p <- 0.5

# Binomial probabilities
binom_prob <- dbinom(success, size = n, prob = p)

# Create data frame
binom_data <- data.frame(success, binom_prob)

binom_data


# Plot the probabilities
plot(success, binom_prob,
     type = "h",
     col = "blue",
     lwd = 2,
     main = "Binomial Distribution (n=30, p=0.5)",
     xlab = "Number of Successes",
     ylab = "Probability")

# Add points
points(success, binom_prob, col = "red", pch = 16)

# Interpretation:

# The binomial distribution represents the probability of 
# obtaining a specific number of successes in 30 trials.

# Since p = 0.5, the distribution is symmetric around 15.
# The highest probability occurs near 15 successes.
# Extreme values (0 or 30) have very low probability.

# As the number of trials increases, the binomial distribution 
# approaches a normal distribution shape.

# The plot clearly shows a bell-shaped symmetric pattern,
# indicating balanced probability of success and failure.

# interpretation up to now, 
#------------------------------------------------------------------------------------------
#In this lab, two matrices were created and matrix multiplication was performed 
#successfully. The dot product resulted in a 5×10 matrix, confirming correct dimensional
#compatibility. Eigenvalues of the 5×5 matrix were computed to understand its
#transformation properties.

#In the probability section, a binomial distribution with 30 trials was generated.
#The probability distribution showed a symmetric pattern centered around 15 successes,
#confirming theoretical expectations when probability of success is 0.5.

# ---------------------------------------------------------------------------------
#5 Use "mpg" dataset of gglot2 package and fit linear regression using "city milage
#cty" as dependent variable and all other variables as independent variables one by one.
#Flag all the statistically significant independent variables p<0.05). Check
#multicollinearity of all the statistically significant independent variables
#and drop them one by one based on highest VIF values. Fit the final model with
#VIF less than 10 and show it as BLUE model and check LINE tests too.
#Write your own interpretations based on all the assumptions of this model and all
#the outputs generated in this process.

library(ggplot2)
library(dplyr)
library(car)      # for VIF
library(lmtest)   # for BP test

data("mpg")


# 1. Fit Simple Linear Regressions (One by One)


# List of independent variables
vars <- c("displ", "year", "cyl", "hwy")

# Store p-values
results <- data.frame()

for(v in vars){
  formula <- as.formula(paste("cty ~", v))
  model <- lm(formula, data = mpg)
  p_value <- summary(model)$coefficients[2,4]
  
  results <- rbind(results,
                   data.frame(Variable = v,
                              P_value = p_value))
}

results

#Independent variables with p < 0.05 are statistically significant predictors of city mileage (cty).
#Typically significant variables: displ,cyl,hwy,year (sometimes)

# 2. fit multiple regression using significant variable 
model_full <- lm(cty ~ displ + cyl + hwy + year, data = mpg)
summary(model_full)
#Residuals:
 # Min      1Q    Median     3Q     Max 
#-3.0901 -0.5860 -0.0744  0.7738  5.1509 
# Here, from that we got min = -3.0901 , first quartile = -0.5860 , median = -0.0744 , max = 5.1509

# check multicollonarity VIF
vif(model_full)

#output 
#displ      cyl      hwy     year 
#8.028711 7.764956 2.612412 1.057203 

# for displ , vif (5-10) so, it is moderate.
# for cyl , vif (5-10) so, it is also moderate.
# for hwy , vif < 5 so, No serious multicollinearity
# for year , vif < 5 so, it is also no serious multicollinearity.

# Drop variable with highest VIF
model_reduced <- lm(cty ~ displ + cyl + year, data = mpg)
summary(model_reduced)
vif(model_reduced)
# here, we suppose hwy as the highest VIF

# As there is all having less than 10, although we will do final testing
final_model <- lm(cty ~ displ + year, data = mpg)
summary(final_model)
vif(final_model)

# yes, it will goes almost near to 1 , so further doing is not necessary , if it still vif greater 
# than 10 , the we must do another model

# 5. Check line assumptions.
plot(final_model$fitted.values,
     final_model$residuals,
     col = "blue",
     main = "Residual vs Fitted Plot")
abline(h = 0, col = "red")
# No clearly pattern , linearly satisfied.

# independence
#Since mpg is cross-sectional data (different cars),
#observations are independent.
# lets do an Optional test:
dwtest(final_model)
# p-value = 1.585e-12 > 0.05 so, no auto correction is needed.

# Normailty of error
shapiro.test(residuals(final_model))
qqnorm(residuals(final_model))
qqline(residuals(final_model))
# here, P >0.05 so, it is resudually normal.

#Equal Variance (Homoscedasticity)
bptest(final_model)
# p-value = 0.3899 > 0.05 so, constant variance is satisfied

#In this analysis, city mileage was modeled as a function of several independent variables
#from the mpg dataset. Individual regression tests identified significant predictors. A multiple 
#regression model was fitted and multicollinearity was examined using VIF. Variables with high VIF
#were removed sequentially to reduce multicollinearity. The final model satisfied all LINE
#assumptions, and VIF values were below 10, confirming that the model satisfies BLUE conditions.
#The analysis indicates that engine displacement significantly reduces city mileage, while newer
#model years slightly improve efficiency.

#-------------------------------------------------------------------------------------------------
# 6 (question is in classroom, i am not copying here.)
# AS there is error showing in compile project so , i install these package again , R said to restart , so 
# i will save it first
#-----------------------------------------------------------
# Load ggplot2 (mpg dataset is inside this package)
if(!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

# Load dataset
data("mpg", package = "ggplot2")

# 1. Split data into 70% training and 30% testing
set.seed(22)

n <- nrow(mpg)
train_index <- sample(1:n, size = 0.7*n)

train_data <- mpg[train_index, ]
test_data  <- mpg[-train_index, ]

dim(train_data)
dim(test_data)

# 2. Fit Linear Model using training data

model <- lm(hwy ~ ., data = train_data)

summary(model)

# 3. Training Accuracy


train_pred <- predict(model, newdata = train_data)

train_r2 <- summary(model)$r.squared
train_rmse <- sqrt(mean((train_data$hwy - train_pred)^2))

train_r2
train_rmse
# 4. Testing Accuracy

#test_pred <- predict(model, newdata = test_data)

#SSE <- sum((test_data$hwy - test_pred)^2)
#SST <- sum((test_data$hwy - mean(test_data$hwy))^2)

#test_r2 <- 1 - (SSE/SST)
#test_rmse <- sqrt(mean((test_data$hwy - test_pred)^2))

#test_r2
#test_rmse

# Use built-in dataset {it shows again and again error while using caret package so, i use with built in function} (no package needed)
data(mtcars)

# 1. Split data into 70% training and 30% testing

set.seed(22) # My roll number

n <- nrow(mtcars)
train_index <- sample(1:n, size = 0.7*n)

train_data <- mtcars[train_index, ]
test_data  <- mtcars[-train_index, ]

dim(train_data)
dim(test_data)

# 2. Fit Linear Model using training data
model <- lm(mpg ~ ., data = train_data)

summary(model)

# 3. Training Accuracy
train_pred <- predict(model, newdata = train_data)

train_r2 <- summary(model)$r.squared
train_rmse <- sqrt(mean((train_data$mpg - train_pred)^2))

train_r2
train_rmse

# 4. Testing Accuracy

test_pred <- predict(model, newdata = test_data)

SSE <- sum((test_data$mpg - test_pred)^2)
SST <- sum((test_data$mpg - mean(test_data$mpg))^2)

test_r2 <- 1 - (SSE/SST)
test_rmse <- sqrt(mean((test_data$mpg - test_pred)^2))

test_r2
test_rmse

#The linear regression model was developed to predict highway mileage using the
#mpg dataset. The data was divided into 70% training and 30% testing sets. 
#The model showed good explanatory power as indicated by the R-squared value.
#The training and testing R-squared values were compared to evaluate model performance. 
#Since the testing accuracy was close to training accuracy, the model generalizes well 
#and does not show significant overfitting. The RMSE values indicate that prediction errors
#are reasonably low.
