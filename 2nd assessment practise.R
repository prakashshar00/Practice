# Barchart 
# 
# A bar chart is a graphical representation used to compare categorical data using rectangular bars. 
#The height of each bar represents the value of the category. In R, bar charts can be created using 
#the ggplot2 package.
# Syntax: ggplot(data, aes(x=category, y=value)) + geom_bar(stat="identity")
  ggplot(data, aes(x=category, y=value)) + geom_bar(stat="identity")
library(ggplot2)
data <- data.frame(
  category = c("A", "B", "C", "D"),
  value = c(10, 15, 7, 20)
)
ggplot(data, aes(x = category, y = value)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  theme_minimal() +
  labs(title = "Bar Chart", x = "Category", y = "Value")
# From the graph, Management faculty has the highest number of students. Bar charts are useful because they allow easy comparison between categories. They are simple to understand and visually clear.
# ---------------------------------------------------------------------------------------------------------
# Histogram
# A histogram represents the frequency distribution of continuous data using bins, while a density plot shows the smooth distribution of data.
# syntax : ggplot(data, aes(x=value)) + geom_histogram() + geom_density()
data <- data.frame(marks = c(40,50,60,70,80,90,55,65))

ggplot(data, aes(x=marks)) +
  geom_histogram(aes(y=..density..), fill="green") +
  geom_density(color="red")
# From the graph, we can see that the distribution of marks is approximately normal, with a peak around 70. Histograms are useful for understanding the distribution of data and identifying patterns such as skewness or modality.
# ---------------------------------------------------------------------------------------------------------------
# Boxplot
# A boxplot, also known as a box-and-whisker plot, is a graphical representation of the distribution of a dataset that shows the median, quartiles, and potential outliers.
# Syntax: ggplot(data, aes(x=category, y=value)) + geom_boxplot()

data <- data.frame(
  gender = c("M","F","M","F"),
  income = c(20000,25000,22000,27000)
)

ggplot(data, aes(x=gender, y=income)) +
  geom_boxplot()
# From the graph, we can see that the median income for females is higher than that of  males. Boxplots are useful for comparing distributions between groups and identifying outliers in the data.

#----------------------------------------------------------------------------
# Barchart (mtcars)
library(ggplot2)
ggplot(mtcars,aes(x=factor(cyl)))+
  geom_bar(fill = "green")

# Histogram  +Density(mtcars)

#------------------------------------------------------------------------------------
#Youtube Video
library(tidyverse)
my_data <- starwars %>%
  select(sex,height) %>%
  filter(sex %in% c("male","female")) %>%
  drop_na(height)
my_data

t.test(height ~ sex, data= my_data)
#---------------------------------------------------------------------------------------
library(tidyverse)
library(forcats)
view(gss_cat)

my_data <- gss_cat %>%
  select(marital) %>%
  filter(marital %in% c("Married",
                        "Never married",
                        "Divorced")) %>%
  mutate(marital = fct_drop(marital))
my_data
my_table <- table(my_data)
my_table
View(my_table)
chisq.test(my_table)

# Anova in two minutes
library(tidyverse)
View(msleep)

my_data <- msleep %>%
  select(vore, sleep_rem) %>%
  drop_na()

mod1 <- aov(sleep_rem ~vore, data = my_data)
summary(mod1)
data(mpg)
data
#-----------------------------------------------------------------------------------
#Normality test
data(mpg)
head(mpg)
str(mpg)

summary(mpg$cty)
mean(mpg$cty)
median(mpg$cty)
sd(mpg$cty)

hist(mpg$cty,
     xlab = "Number",
     ylab = "Frequency",
     col="lightgreen",
     main = "the histogram of cty")
boxplot(mpg$cty)

shapiro.test(mpg$cty)
# so it is not normal :
set.seed(22) 
my_data <-rnorm(4000, mean = 50 , sd = 10)
hist(my_data)
shapiro.test(my_data)
qqnorm(my_data)
lines(density(my_data), col = "red", lwd = 2)
var(my_data)
t.test(my_data)$conf.int
t.test(my_data,mu=50)
#-----------------------------------------------------------------
data(mpg)
str(mpg)
table(mpg$drv)
aggregate(cty~ drv, data = mpg, mean)
boxplot(cty~ drv , data = mpg , col ="lightgreen")
shapiro.test(mpg$cty)

data(mpg)

# Explore
summary(mpg$cty)
summary(mpg$hwy)

# Difference check
diff = mpg$cty - mpg$hwy
diff
# Normality of difference
shapiro.test(diff)

# Final test
t.test(mpg$cty, mpg$hwy, paired = TRUE)
Shapiro-Wilk normality test
data(mpg)

# Explore
table(mpg$class)

# Boxplot
boxplot(cty ~ class, data = mpg, col="pink")

# Normality
shapiro.test(mpg$cty)

# ANOVA
model <- aov(cty ~ class, data = mpg)
summary(model)
wilcox.test(mpg$cty, mu = 20)
log_cty <- log(mpg$cty)
shapiro.test(log_cty)

#################################################################################
#################################################################################
#################################################################################
# Read csv
data<- read.csv("Sales.csv",header=TRUE)
# Read excel 
data <- read.excel("sales.xls")
# Data base Connection
library(DBI)
library(RSQLite)
conn <- dbConnect(SQLite(),"location")
dbListTables(conn )
dbReadTable(conn,"Survey")
dbDisconnect(conn)
# sql 
dbGetQuery(conn,"SELECT * FROM Question limit")
# read foreign data
library(foreign)
read.spss("data.sav")
# frequency table
table(data3$ZONE)
# percentage Calculation
prop.table(table(iris$Species))*100
#subsetting rows
subset(mtcars,cyl==6)
# selecting columns
mtcars[,c("mpg","hp")]
# condition filtering 
iris[iris$Sepal.Length>6,]
# handling missing values
sum(is.na(airquality)) # show the total missing observation
# Removing NA values
na.omit(airquality)
# plot
boxplot(mtcars$mpg)
hist(airquality$Ozone)
plot(mtcars$hp,mtcars$mpg)
mean(mtcars$mpg)
# group wise mean
tapply(mtcars$mpg, mtcars$cyl, mean)
# data transformation
mtcars$efficincy <- mtcars$mpg / mtcars$hp
# sorying data
mtcars[order(mtcars$mpg)]
# max and min
max(iris$Sepal.Length)
min(iris$Sepal.Length)
# correleation
cor(mtcars$mpg,mtcars$hp)
# data frame creation
df <- data.frame(
  name = c("Prakash","Subina"),
  score = c(80,70)
)
# logical operator
subset(mtcars, mpg>20 & cyl == 4)
# if else condition
ifelse(mtcars$mpg>20,"good","bad")
# factor variable
factor(iris$Species) # seperates commom
# rename
colnames(mtcars)[1] <-"Milege"
# Data dimension 
dim(iris)
# row count
nrow(airquality)
#col count 
ncol(mtcars)
# sampling data
sample(mtcars$mpg,5)
# duplicate detection
duplicated(iris)
# Removes duplicates
unique(iris)
# Apply function 
apply(mtcars, 2, mean) # 1 - row , 2- col
# Aggregate function
aggregate(mpg~cyl,data=mtcars,mean)
#data type conversion
as.numeric(mtcars$cyl)
# creating factor levl
factor(mtcars$cyl,labels = c("four","six","eight"))
# saving data
write.csv(mtcars,"mtcars.csv")
# read data
read.csv("mtcars.csv")
# outlier detection 
IQR(mtcars$mpg)
# log transformation # reduce skewness
log(mtcars$hp)
# data sorting
mtcars[order(-mtcars$mpg),]
# summary by category 
by(mtcars$mpg,mtcars$cyl,summary)
# count by category
table(mtcars$cyl)
# creating logical column 
mtcars$high_mog <- mtcars$mpg>25
# removing column
mtcars$high_mog <- null
# data binding
cbind(mtcars,efficiency = mtcars$mpg/mtcars$hp)
# matrix creation
a <- matrix(1:9,nrow = 3)
a
# dimension 
dim(a)
# matrix by row
b <- matrix(1:9,nrow = 3, byrow =TRUE)
b
# add
a+b
# multiply
a-b
#scalar multiply
2*a
# Matrix multiplication
A % *% b #(b*a)
b %*% a # (a*b)
a*b #(elementwise)
# transpose
t(a)
t(t(a))
# diagonal matrix
d<-diag(c(2,4,6))
d
# det
det(a)
# inverse 
solve(a) 
#eigen 
eigen(a)

#####################################################################################################
# probability (bd -. number )
dbinom(3,5,0.5)
# normal distribution 
pnorm(70,mean=70,sd=10)
dnorm(70,mean=70,sd=10)
# testing of hypothesis
t.test(c(10,20,30), mu=20)
#  chisquare test
matrix <- matrix(c(10,20,30,40), nrow=2)
chisq.test(matrix)
# correlation
cor(c(1,2,3), c(2,4,6))
# regression
weight <- c(10,20,30,25)
height <- c(125,120,100,125)
model <- lm(weight ~ height, data=data)
#summary(model) Coefficients show relationship strength. R² shows model accuracy.
library(ggplot2)
# bargraph of mpg dataset
ggplot(mtcars, aes(x=factor(cyl))) +
  geom_bar(fill="blue")

# histogram of mtcars dataset
ggplot(mtcars, aes(x=mpg)) +
  geom_histogram(aes(y=..density..), bins=10, fill="green") +
  geom_density(color="red")

# boxplot of iris
ggplot(iris, aes(x=Species, y=Sepal.Length)) +
  geom_boxplot()

# scatter plot of mtcars
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point()

mean(airquality$Temp, na.rm=TRUE)
median(airquality$Temp, na.rm=TRUE)
var(airquality$Temp, na.rm=TRUE)

#------------------------------------------------------------------------
# ==============================
# Load Package
# ==============================
library(ggplot2)

# ==============================
# UNIT 5: GRAPHICS
# ==============================

# 1. Bar Chart
ggplot(mtcars, aes(x=factor(cyl))) +
  geom_bar(fill="blue")
# Interpretation:
# Shows count of cars by cylinder.
# More bars = higher frequency category.

# 2. Histogram + Density
ggplot(mtcars, aes(x=mpg)) +
  geom_histogram(aes(y=..density..), bins=10, fill="green") +
  geom_density(color="red")
# Interpretation:
# Shape shows distribution of mpg.
# Symmetry indicates normal distribution; skew shows bias.

# 3. Box Plot
ggplot(iris, aes(x=Species, y=Sepal.Length)) +
  geom_boxplot()
# Interpretation:
# Displays median, quartiles, and outliers.
# Useful to compare spread among species.

# 4. Scatter Plot
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point()
# Interpretation:
# Shows relationship between weight and mileage.
# Downward trend indicates negative correlation.

# 5. Summary Measures
mean(airquality$Temp, na.rm=TRUE)
median(airquality$Temp, na.rm=TRUE)
var(airquality$Temp, na.rm=TRUE)
# Interpretation:
# Mean = average temperature.
# Median = middle value.
# Variance = spread of data.


# ==============================
# UNIT 6: PROBABILITY
# ==============================

# 1. Random Numbers
runif(10)
rnorm(10)
# Interpretation:
# runif → uniform distribution.
# rnorm → normal distribution random values.

# 2. Binomial Distribution
dbinom(3, size=5, prob=0.5)
# Interpretation:
# Probability of exactly 3 successes in 5 trials.

# 3. Poisson Distribution
dpois(2, lambda=3)
# Interpretation:
# Probability of 2 events when average rate is 3.

# 4. Normal Distribution
pnorm(70, mean=60, sd=10)
# Interpretation:
# Cumulative probability up to value 70.

# 5. Q-Q Plot
qqnorm(mtcars$mpg)
qqline(mtcars$mpg)
# Interpretation:
# If points lie on line → data is normally distributed.


# ==============================
# UNIT 7: STATISTICAL INFERENCE
# ==============================

# 1. One Sample t-test
t.test(mtcars$mpg, mu=20)
# Interpretation:
# If p-value < 0.05 → reject null hypothesis.
# Mean is significantly different from 20.

# 2. Independent t-test
t.test(mpg ~ am, data=mtcars)
# Interpretation:
# Compares mpg between automatic and manual cars.
# Significant p-value shows difference between groups.

# 3. Paired t-test
t.test(airquality$Temp, airquality$Wind, paired=TRUE)
# Interpretation:
# Compares paired values.
# Checks if mean difference is significant.

# 4. Chi-square Test
tbl <- table(mtcars$cyl, mtcars$gear)
chisq.test(tbl)
# Interpretation:
# Tests independence between variables.
# Small p-value → variables are dependent.

# 5. F-test (Variance Test)
var.test(mpg ~ am, data=mtcars)
# Interpretation:
# Compares variance of two groups.
# Significant result → variances differ.


# ==============================
# UNIT 8: CORRELATION & REGRESSION
# ==============================

# 1. Correlation
cor(mtcars$wt, mtcars$mpg)
# Interpretation:
# Value near -1 → strong negative relation.
# Value near +1 → strong positive relation.

# 2. Simple Linear Regression
model1 <- lm(mpg ~ wt, data=mtcars)
summary(model1)
# Interpretation:
# Coefficient shows effect of weight on mpg.
# R² shows model accuracy.

# 3. Multiple Regression
model2 <- lm(mpg ~ wt + hp, data=mtcars)
summary(model2)
# Interpretation:
# Shows effect of multiple variables on mpg.
# Each coefficient shows individual impact.

# 4. ANOVA (F-test)
anova(model2)
# Interpretation:
# Tests overall model significance.
# Small p-value → model is significant.

# 5. R-squared
summary(model1)$r.squared
# Interpretation:
# Shows percentage of variation explained by model.
# Higher value → better model fit.