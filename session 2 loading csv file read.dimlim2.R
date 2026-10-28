# Reading text data from internet, saving as CSV
# file and reading it from computer

# read.delim2() is a data import function in R used to read files 
   # columns are seperated by tabs("\")
    # decimal seperator is comma(,),not(.)

ch11b <-
  read.delim2("http://www.stats.ox.ac.uk/pub/datasets/csb/ch11b.dat", header = F, sep="")
ch11b

ch11b <-
  read.delim2("http://www.stats.ox.ac.uk/pub/datasets/csb/ch11b.dat", header = T, sep="")
ch11b

#Saving child data as CSV file
write.csv(ch11b,"ch11b.csv")
#Loading the CSV file from working directory
child2<- read.csv("ch11b.csv",header=T)
child2

getwd()# shows the working directory
