# session 1

# summary data : R has specific function summary to summary data including min,
# q1, median, mean q3 and max

data1<- c(1:20)
data1

# we can visualize data usinh boxplot

boxplot(data1)

data2 <- data1^2
summary(data2)

data<- cbind(data1,data2)
data
str(data)

head(data)
class(data)

# creating data frame of data
df<- data.frame(data)
df
str(data)
class(df)
head(df)

head(cars) # R has automatic car data in storage
data.frame(cars)
cars$speed
cars$dist # dany data name + "$" helps to find specific data 
summary(cars)
boxplot(cars$speed)
hist(cars$speed)
plot(cars)
