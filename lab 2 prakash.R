# Name : Prakash Sharma
# Roll No : 22
# Lab Work 2 : Exploratory Data Analysis using mpg Dataset
# ----- this line helps to separate question 
#---------------------------------------------------------------------------------------------
#1 load "mpg" dataset from ggplot2
library(ggplot2)
data("mpg") # it loads the dataset 
head(mpg) # it gives the first 5 dataset from mpg 
View(head(mpg))
# As from the table we find "Showing 1 to 6 of 6 entries, 11 total columns"
# View helps to visualize the data more clearly in table format in another tab

#--------------------------------------------------------------------------------------------
#2 Structure of dataset
str(mpg)

# it shows that the data contain the information of 
# 1. manufacturer
# 2.model
# 3. displ
# 4. year
# 5. cyl
# 6. trans
# 7. drv
# 8. cty
# 9. hwy
# 10. fl
# 11. class

# mpg dataset contains information about fuel economy of cars.
# It has 234 observations and 11 variables.
# Categorical variables: manufacturer, model, trans, drv, fl, class
# Continuous variables: displ, year, cyl, cty, hwy
# Each row represents one car model.

# --------------------------------------------------------------------------------------------------------------
#3.# Get barplots of a few categorical variables using basr R codes and interpret them carefully
# Here, categorical data are manufacture, model, trans , drv , fl and class 
# first i will do for class data 
class_freq <- table(mpg$class)

barplot(class_freq,col = "pink",main = "Barplot of Car Classes",xlab = "Car Class",ylab = "Frequency")

# main -- its helps to write the title in the graph
# xlab -- it helps to label the graph in x-axis 
# ylab -- it helps to label the graph in y-axis
# col -- it helps to fill color in the graph

# Interpretation:
# SUV and compact cars appear more frequently.
# Some categories like 2seater have very few observations.

# Now for another categorical data drv
# Barplot of drive type
drv_freq <- table(mpg$drv)

barplot(drv_freq,col = "green",main = "Barplot of Drive Type",xlab = "Drive Type",ylab = "Count")

# Interpretation:
# Front-wheel drive (f) vehicles are most common.
# Rear-wheel drive (r) vehicles are least common.

# another one 
# Bar plot of manufacturer (Base R)
manu_freq <- table(mpg$manufacturer)

barplot(manu_freq,
        col = "lightblue",
        main = "Barplot of Car Manufacturers",
        xlab = "Manufacturer",
        ylab = "Number of Cars",
        las = 2)

# Interpretation:
# Some manufacturers such as Toyota and Chevrolet 
# produce more models in this dataset.
# A few manufacturers have limited entries.

# -----------------------------------------------------------------------------------------------------------------
#4.Get boxplots of a few continuous variables and interpret using base R codes
# some of the continuous variables are : displ, year, cyl, cty, hwy
# Boxplot of highway mileage : hwy 
boxplot(mpg$hwy,col = "lightgreen",main = "Boxplot of Highway Mileage",ylab = "Highway MPG")

# here is as same indication for x- axis , y- axis , the the title . 
# main is used for written title, xlab is for labeling x-axis , ylab is for labeling y-axis and color for coloring it. 

# Interpretation:
# Median highway mileage is around mid-20s.
# Some cars have very high mileage (outliers).


# Boxplot of engine displacement
boxplot(mpg$displ,col = "pink",main = "Boxplot of Engine Displacement",ylab = "Engine Displacement (Liters)")

# Interpretation:
# Most engines range between 2 to 4 liters.
# Some large engines appear as extreme values.


#--------------------------------------------------------------------------------------------------------------
#5.Get histogram of a few continuous variables using ggplot2 library li and interpret them carefully
# Histogram of city mileage
ggplot(mpg, aes(x = cty)) +
  geom_histogram(fill = "purple", color = "black", bins = 20) +
  labs(title = "Distribution of City Mileage",
       x = "City MPG",
       y = "Frequency")

# Interpretation:
# Distribution is slightly right-skewed.
# Most cars have city mileage between 15–25 mpg.


# Histogram of highway mileage
ggplot(mpg, aes(x = hwy)) +
  geom_histogram(fill = "darkblue", color = "black", bins = 20) +
  labs(title = "Distribution of Highway Mileage",
       x = "Highway MPG",
       y = "Frequency")

# Interpretation:
# Majority of cars have highway mileage between 20–30 mpg.
# Few cars achieve very high efficiency.

# another one 
ggplot(mpg, aes(x=displ))+
  geom_histogram(fill = "darkgreen",color="black",bins=15)+
  labs(title = "Distribution of engine Displacement",
       x = "Engine size(Liters)",
       y = "Frequency")
# Interpretation:
# Most vehicles have engine size between 2 and 4 liters.
# The distribution is slightly right-skewed.
# Larger engines are less common.

#-------------------------------------------------------------------------------------------------------------
#6. Get scatterlot matrix of all the continuous variables and interpret it carefully
# first, we need to select continuous variables
continuous_vars <- mpg[, c("displ", "cyl", "cty", "hwy", "year")]
# then , we kept them in column vector
pairs(continuous_vars,
      col = "darkred",
      main = "Scatterplot Matrix of Continuous Variables")
# we pair all the continous variable , which help us to visualize all parameter in same plots

# Interpretation:
# Strong positive relationship between cty and hwy.
# Engine displacement (displ) is positively related to cylinders (cyl).
# Higher engine size generally results in lower mileage.
# Year variable shows slight variation but no strong linear pattern.

# another one :Engine Size vs Highway Mileage
plot(mpg$displ, mpg$hwy,
     col = "red",
     main = "Engine Size vs Highway Mileage",
     xlab = "Engine Displacement (Liters)",
     ylab = "Highway MPG",
     pch = 19)

# Interpretation:
# There is a negative relationship between engine size and mileage.
# As engine displacement increases, highway mileage decreases.
# Smaller engines are generally more fuel efficient.

# -----------------------------------------------------------------------------------------------------------------
#In this lab, the mpg dataset from the ggplot2 package was analyzed.
#The structure revealed both categorical and continuous variables describing car characteristics and fuel efficiency.

#Barplots showed that SUVs and front-wheel-drive vehicles are most common.
#Boxplots revealed variation and outliers in mileage and engine size.
#Histograms indicated that most vehicles have moderate fuel efficiency.
#The scatterplot matrix showed strong positive correlation between city and highway mileage and an inverse relationship between engine size and fuel efficiency.

#This lab helped in understanding exploratory data analysis using both Base R and ggplot2.
# ---------------------------------------------------------------------------------------------------------------------------

#7. Perform t test of any two variables of your choice. Justify your choice and test all the assumptions of this test with interpretations of all the results
#We will compare Highway Mileage (hwy) between:
# Front-wheel drive (f)
# Rear-wheel drive (r)
# We choose:
    #Dependent variable: hwy (continuous)
    #Grouping variable: drv (categorical with levels f, r, 4)
#Reason:
#Highway mileage may differ depending on drive type.
#It is reasonable to test whether fuel efficiency differs between front-wheel and rear-wheel drive vehicles.

#---------------------------------------------------------------------------------
#----------------------------------------------------------------------------------
#----------------------------------------------------------------------------------
# practise durning exam as there is difficult to switch tabs
dbinom(3,5,0.5)
dbinom(3,size =5 , prob = 0.5) # they are same 
library(ggplot2)
data("mpg")
head(mpg)
str(mpg)

class_freq <- table(mpg$class)
barplot(class_freq,
        col = "pink",
        main="The graph of class inside mpg",
        xlab="car class",
        ylab ="frequency")

boxplot(mpg$hwy,
        col = "lightgreen",
        main = "Boxplot of engine displacement",
        ylab ="Engine Displacement")
#---------------------------------------------------------------------------------
#---------------------------------------------------------------------------------
#----------------------------------------------------------------------------------

# T- Test : highway Mileage between Front and Rear Drive Cars
library(ggplot2)
library(dplyr)

data("mpg")
# Select only front (f) and rear (r) drive vehicles
mpg_subset <- mpg %>%
  filter(drv %in% c("f", "r"))

# 1. Check Sample Sizes
table(mpg_subset$drv)

# it shows that front is 106 and rare is 25

# 2. Check Normality Assumption
# Shapiro-Wilk test for both groups

shapiro.test(mpg_subset$hwy[mpg_subset$drv == "f"])
shapiro.test(mpg_subset$hwy[mpg_subset$drv == "r"])

# If p-value > 0.05 → data approximately normal
# in rare , p - value is 0.03317 so, data not as like normal 

#3. Check Homogeneity of Variance
var.test(hwy ~ drv, data = mpg_subset)

# If p-value > 0.05 → equal variances assumed
# the p - Value is 0.4418 which is greater than, 0.05 so, we assumed equal variance

#4. Perform Independent Sample T-Test
t.test(hwy ~ drv, data = mpg_subset,var.equal = TRUE)
#(some theory for better understanding)
# Normality Test --------

#If p-value > 0.05
#→ Data follows approximately normal distribution.

#If p-value < 0.05
#→ Slight deviation, but t-test is robust for moderate sample size.

#Variance Test ---------

#If p-value > 0.05
#→ Variances are equal → we use var.equal = TRUE

#If p-value < 0.05
#→ Variances unequal → use Welch t-test (default)

# T- Test -----
#If p-value < 0.05:
  
#There is a statistically significant difference in highway mileage between front-wheel and rear-wheel drive vehicles.

#If p-value > 0.05:
#There is no statistically significant difference in highway mileage between the two drive types.

# Interpretation 
#Usually in mpg dataset:
  
  #Front-wheel drive cars have higher highway mileage compared to rear-wheel drive cars.

#This suggests that drive type influences fuel efficiency.

#------------------------------------------------------------------------------------------------------------------------------
#8. Perform 1-way ANOVAtest of any two variables of your choice. Justify your choice and test all the assumptions of this test
# with interpretations of all the results

# One-Way ANOVA: Highway Mileage across Car Classes
library(ggplot2)
library(dplyr)

data("mpg")

# 1. Check Structure
str(mpg$class)
str(mpg$hwy)

# 2. Visual Inspection (Boxplot)

boxplot(hwy ~ class,data = mpg,col = "lightblue",main = "Highway Mileage across Car Classes",
        xlab = "Car Class",
        ylab = "Highway MPG",
        las = 2)

# 3. Check ANOVA Assumptions
# (A) Normality of residuals

anova_model <- aov(hwy ~ class, data = mpg)

shapiro.test(residuals(anova_model))
# here p = 1.058e-10 which is < 0.05 so, ANOVA is robust due to large sample size(234)

# If p > 0.05 → residuals approximately normal
# (B) Homogeneity of Variance

bartlett.test(hwy ~ class, data = mpg)

# If p > 0.05 → equal variances
# here p value is 3.692e-09 so, Variance differ
# 4. Perform One-Way ANOVA

summary(anova_model)

# 5. Post Hoc Test (if ANOVA significant)

TukeyHSD(anova_model)

#Usually, ANOVA shows significant difference because:
#Compact cars have higher mileage.
#SUVs and pickups have lower mileage.
#Midsize cars fall in between.
#Thus, vehicle class significantly affects fuel efficiency.