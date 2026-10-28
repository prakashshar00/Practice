# Basics of R
#It follows PEMDAS rule

#Parenthesis, Exponents,
#Multiplication, Division, Addition
#and Subtraction

4*6+5
4*(6+5)
(4*6)+5
(4 + 6)^2 * 5 / 10 + 9 - 1

# variables is R
 x <- 2 #(preferred)
x
 x = 2
x
 2 -> x
x

# R is case sensitive

# Datatypes
x <- c(1,2,3,4,5,6,7,8,9)
x
class(x)
is.numeric(x)

y<-c(1L,2L,3L,4L,5L,6L,7L,8L,9L)
is.numeric(x)
class(y)

a<-4L*2.8
a
class(a)

class(4L)
class(2.8)
class(4L * 2.8)

class(5L)
class(2L)
class(5L/2L)

class(4L * 5L) 
class(2L + 4L + 5L)

# Character
x<- "data"
x

# Factor
y<- factor("data")
y
class(y)

