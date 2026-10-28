#------------------------------------------------------------------------------------
# 7.  Air quality data
aq <- airquality
aq 
# as data is not load properly i write it as csv file
#write.csv(airquality,"airquality.csv")
#aq <- read.csv(airquality.csv)
#a
str(aq) # check the structure of aq
#b
head(aq)
clean <- na.omit(aq) # the function omit helps to clean data
clean
 # as it is difficult to watch all data so, i will show the output of head
head(aq)  # have NA in 5 and 6 row as we see in output
head(clean) # there is no missing value seen 

#c
summary(clean)
# As we seen there is ozone, solar. R , wind, TEmp , Month and day column 
# here the below there is proper summary of air quality data column including min,1st Q, median, 3rd Q,max
#-------------------------------------------------------------------------------------------
# 8 create an ephemereal in memory RSQLite database and show it has 0 tables
# write mtcars data to this database and check the number of fields in the mtcars table
# read this table and fetch the result for: SELECt all from mtcars where cyl == 8
library(DBI) # load the library DBI
library(RSQLite)
library(DBI)
library(RSQLite)
library(ggplot2)

duckdb <- data.frame(
  
)
duckdb # its blank there is no field and no data

duckdb <- as.data.frame(diamonds)
duckdb



#--------------------------------------------------------------------------------------------

#10.
#a.
A<- matrix(1:6,nrow = 2,ncol = 3) # it gives the matrix A with two rows and 3 column 
A
B <- matrix(7:12, nrow = 2 , ncol = 3) # it gives the matrix B with two rows and 3 column
B

#b
# Matrix Multiplication 
#B%*%A as this two matrix is not multiple as no of col of 1st matrix is not equal to no of row of 2nd 
# dot product
A*B # this multiples each element to its corresponding
a <- matrix(1:9,nrow=3)
b <- matrix(1:9,nrow=3)
a%*%b

# eigen(A) as A is not square matrix
eigen(a)
# eigen(B) as B is not square matrix
eigen(b)

#------------------------------------------------------------------------------

# 6
R<-c(1:15) # it stores the values in column
R
b <-seq(1:15) # it gives sthe values in sequences
b

#b
N<- c(1.1,2.2,3.3,4.4,5.5)
N

# Addition 
add = R + N # as the size of data is different is add recursively
add

# subtraction 
sub = N - R # as the size of data is different , it is sub recursively
sub

# Multiplication
mul = N*R   
mul

# divide
divide = N/R
divide

#-------------------------------------------------------------------------------
#9

library(dplyr)
tibble1 <- tibble(
  id = c(1,2,3,4,5),
  name = c("Prakash","Pradeep","Charlie","Subimna","Anjila")
  
)
tibble2 <- tibble(
  id = c(1,2,3,4,5),
  age = c(25,30,35,22,28)
)
merged_tibbles <- left_join(tibble1,tibble2,by ="id")
merged_tibbles

# comparison 
# As one tibble contains the name and id of 5 member and another tibble contain the id and age
# as the tipple is merges as left join which joins the left and right table as common id column and 
# as it completely kept all data of 1st tibble but only merge the data of second tibble having common id 