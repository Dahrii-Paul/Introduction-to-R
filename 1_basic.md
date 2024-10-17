## Basic operators & Data Types

```R
# Variables in R
x=12
x
y<- "Hello"
y
TRUE ->B
B
############################
#Operators
#Arithmetic operators
2+3 #add
3-1 #sub
2*3 #multi
6/2 #division
2^3 #power
5%%2 # Remainder
7%/%3 #quotient
#########################
#assignment
x=5
x<-15
x<<-30
25->x
x
#######################
#Relational Operators
# >
2>3 #greater
2<3 #less
2==2 #equal
2!=3 #not equal
2>=3
2<=3
############################
#Logical operators
#AND Operator “&”
# & takes two logical values and returns TRUE only if both values are TRUE themselves
x <- 12
x > 5 & x < 15

# OR operator "|"
#works similarly, but the difference is that only at least one of the logical values should be equal to TRUE for the entire OR operation to evaluate to TRUE
TRUE | TRUE
TRUE | FALSE
FALSE | FALSE
FALSE | TRUE
y <- 4 #16
y < 5 | y > 15

# NOT Operator “!”
#!TRUE evaluates to FALSE, while !FALSE evaluates to TRUE
!TRUE
!FALSE

x=TRUE 
y=FALSE
x&y #returns x if x is false, y otherwise
x&x
y&x

x | y # returns y if x is false
################################
#special operators
# ":" Colon operator
x<- 2:8 
x
y<-5 #9
#used to identify if an element (e.g., a number) belongs to a vector or dataframe
y %in% x
###############################

#Data Type
# Vector
#vectors is a sequence of data elements of the same basic type
#vector_name<-c(list of value: range)
vt1<-c(1,2,3,4)
vtr2=c(1,2,3,4,5)
vtr3<-c(1:12)
#index
#vector_name[index]
vtr3[2]
vtr4<-c(1,5,6,3)
#sort
sort_vtr4<-sort(vtr4)
vtr_mix<-c("hi",1,3,"hey")
class(vtr_mix)
class(vtr4)
vtr<-c(2,3)
sum(c(vtr))
mean(c(vtr))
prod(c(vtr))
##################################
#Lists
#Contain elements of different types like-numbers,strings, vectors and another list inside it

n=c(2,3,5)
n
s=c("aa","bb")
x=list(n,s)
class(x)
list1<-list("JK",12,3,TRUE)
list2<-list("R",14,3,FALSE)
list2
list3<-merge(list1,list2)
list3
class(list3)
list2[2]
#################################
#Vector-1D
#list under one name
#ARRAY
#Array multidimensional data
#can values having similar kinds of data
#array()
vtra<-c(2,3,4,5,6,7)
vtrb<-c(2,3,4,5,6,7,8,9,0,1)
array_1<-array(vtra)
array_2<-array(vtrb)
#using rang
arrayc <- array(1:15,c(4,3))
array_1[4]
multi_array<-array(1:24,c(3,4,2))
multi_array[1,3,1]
dim(multi_array)
a<-array(1:12,c(2,3,2))
dim(a)
dimnames(a)<-list(c("one","Two"),
                  c("a","b","c"),
                  c("A","B"))
################################
#Create a matrix
#special case of two-dimensional arrays.

mat1<-matrix(c(1:9),nrow = 3,ncol =3 )
mat1
mat1<-matrix(c(1:9),nrow = 3)
class(mat1)
mat1<-matrix(c(1:9),nrow=3, byrow = TRUE,
             dimnames=list(c("x","y","z"),
             c("A","B","C")))

mat1[1,2]
#select row and colm
mat1
mat1[c(1,2),c(2,3)]
mat1[1,] #1st row
mat1[,2] #2nd colm
mat1[-1,] #select all the rows except 1st
#modify
mat1[2,2]<-100
#######################################
rm(list=ls())
##matrix(data, nrow,ncol, dimnames)
mat1<-matrix(c(1:9), nrow=3,ncol=3)
mat1
mat2<-matrix(c(1:12), nrow = 3, byrow=T)
mat2
#########################################

#Matrix with row and column name & 
#filling by row wise
mat5<-matrix(c(1:9),nrow = 3, byrow = TRUE,
             dimnames = list(c("x","y","z"),
                             c("a","b","c")))
mat5
colnames(mat5)
rownames(mat5)
#change row name and col name
rownames(mat5)<-c("a1","a2","a3")
colnames(mat5)<-c("x1","x2","x3")
mat5
vtr1<-c(1,2,3,4,5,6,7,8,9,10)
mat6<-matrix(c(vtr1),nrow = 5, byrow = TRUE)
mat6
##################################
## Access matrix element ##
mat6[2,2]
mat3<-matrix(c(1:9),nrow=3,byrow = T)
mat3
a<-mat3[c(1,2),c(2,3)]
mat3[2,2]
#modify single element in matrix
mat3[2,2]<-100
mat3[mat3<5]<-0 
mat3
#matrix operation
mat_trans<-matrix(1:15, nrow=5)
#transpose
t(mat_trans)
#addition
p<-matrix(c(1:12), nrow = 4, byrow = T)
q<-matrix(c(12:23), nrow = 4, byrow = T)
p
q
#addition
p+q
p-q
p*q
p/q
##########################
##Factors##
#Factor is a data structure which are used to categorize the data and store it as levels.

#create a vector
m_status<-c("single","married","divorced","single")
m_factor<-factor(m_status)
class(m_factor)
gender<-factor(c("male","female","female","male","male"))
gender
#ordered factor
mstatus<-factor(m_status,levels=c("single","married","divorced"),
                ordered=T)
levels(mstatus)
min(mstatus)
## generate level ##
a<-gl(4,4, labels = c("hi","hello","hey","aa"))
a
#access factor component
m_factor[1]
## modify factor component
m_factor[1]<-"divorced"
#add new level
levels(m_factor)<-c(levels(m_factor),"widow")
m_factor
m_factor[1]<-"widow"
################################################
#Data frame
#a table or a two-dimensional array-like structure in which each column contains values of one variable and each row contains one set of values from each column.

data_name<-c("a","b","c","d","e")
data_id<-c(1:5)
rollno<-c(11,22,33,44,55)
#create
data_f<-data.frame(data_name,data_id,rollno)
dim(data_f)
str(data_f)
#extract a specific colum
data_f$data_name
data_extr<-data.frame(data_f$data_name,data_f$data_id)
#add one column
data_f
age<-c(12,23,34,45,56)
data_f1<-data.frame(data_f,age)
#display specific rows
data_f1[2,1:2]
#####################
data_f3<-data.frame(
  id=c(11:15),
  name=c("aa","bb","cc","dd","ee"),
  rollno=c(1,2,3,4,5),
  ad_date=as.Date(c("2021-01-01",
                    "2021-01-02",
                    "2021-01-03",
                    "2021-01-04",
                    "2021-01-05")),
  stringsAsFactors=F
)
data_f3
#Automatic string to factor conversion 

str(data_f3)
#stingsAsFactors
data_f3$dept<-c("biochem","micro","env","phy","chem")
data_f3
data_f4<-data.frame(
  id=c(16,17),
  name=c("qq","ww"),
  rollno=c(6,7),
  ad_date=as.Date(c("2021-01-06",
                      "2021-01-07")),
  dept=c("nano","eco"),
  stringsAsFactors=F)
#############################
data_f3
data_f4
data_bind<-rbind(data_f3,data_f4)
##deleting component##
data_bind$dept<-NULL
data_bind
#######################
#loops
a<-6
if(a>5){
  print("a is greater than 5")
}else if (a==5){
  print("a is equal to 5 ")
}else{
  print("a is less than 5")
}
#################################
# read user input
name<-readline(prompt = "Enter the name: ")
age<-readline(prompt = "Enter the age: ")
if(age<=10){
  print("kids")
}else{
  print("adult")
}
#####################################
#switch statement
vtr<-c(1,2,3,4,5)
option<-readline(prompt = "Enter the option: ")
switch (option,
        "mean"=print(mean(vtr)),
        "median"=print(median(vtr)),
        "min"=print(min(vtr))
)
``
#################################
# loops repeat
```R
x=2
repeat{
  x=x^2
  print(x)
  if(x>15)
    break
}
#########################
#while
x=2
while(x<100){
  x=x^2
  print(x)
}
########################
#for
###############
for (i in 1:15) {
  if((i%%2)==0){
    next
  }
  print(i)
}
```
# Data visualization
```R
x<-c(1:10)
y<-c(11,30,16,21,25,26,31,18,33,27)
length(y)
#plot graph
# scatter plot
plot(x,y)
#pie
pie(x,y)
name_data<-letters[1:10]
pie(x,name_data)
#barplot
barplot(x)
#boxplot
boxplot(x)
#hist
hist(y)
?par
#par()<-accomodate several graph
#oma<- all side line space 
par(mfrow=c(2,3), oma=c(2,2,2,2))

#plot 1
#pch<- plotting character
plot(x,y, pch=6)
#dev.off()

#plot 2
plot(x,y, pch=6, type="o")

#plot3 #color
plot(x,y, pch=6, type="o",
    col="red",
    xlab="height",
    ylab="weight")

#plot 4 
plot(x,y, pch=6, type="o",
     col="red",
     xlab="height",
     ylab="weight",
     sub="H/W")
#plot 5
plot(x,y, pch=6, type="o",
     col="red",
     xlab="height",
     ylab="weight",
     sub="H/W", cex.axis=1.5,
     cex.lab=1.0)

#plot 6 las-orient
plot(x,y, pch=6, type="o",
     col="green",
     xlab="height",
     ylab="weight",
     sub="H/W", cex.axis=1.5,
     cex.lab=1.0, las=2)
```
# Data Handeling
```R
getwd()
setwd("/cloud/project/data")
sepsis<-read.csv(file="Sepsis.csv", header=T)
head(sepsis,2)
colnames(sepsis)
x<-read.
delim("clipboard")

sepsis$Shock<-factor(sepsis$Shock,
                     label=c("no","yes"))
sepsis$Alcoholism <-factor(sepsis$Alcoholism, 
                           labels=c("no","yes"))
sepsis$Infarction <-factor(sepsis$Infarction, 
                           labels=c("no","yes"))
head(sepsis)
sepsis<-sepsis[-1]
```



# Linear-Regression_R

**linear regression: <br/>** 
* 1. Use least-squares to fit a line to the data <br/>
* 2. Calculate R^2 <br/>
* 3. Calculate a p-value for R^2 <br/>
 
##### Linear Regression: Process of finding a line that best fits the data points available on the plot <br/>
* *Y = a + bX* <br/>
* *Y = Y-intercept + Slope.X* <br/>
* *SS(mean) = (data - mean)^2* <br/>
* *Variation around the mean = (data-mean)^2 / n*<br/>
*  *Var(mean) = SS(mean) / n*
*  predict a quantitative response of Y on the basis of a single predictor variable X. 
*  It assumes that there is approximately a linear relationship between X and Y


```R
install.packages("MASS")
data(package = "MASS")
library(MASS)
data(cats)
?cats
dim(cats)
head(cats)
class(cats)
str(cats)

# "$" operator is used to extract or subset a specific part of a data object in R.

#extract out male/female from cats datasets
males<-subset(cats, cats$Sex=="M")
females<-subset(cats,cats$Sex=="F")

#plot
# "las"
# "lty" Line type
# "las" labels are parallel (=0) or perpendicular(=2) to axis
# "lwd" Specifies the line width
# "pch" 
plot(males$Bwt,males$Hwt, pch=8,
     xlab="Bwt",ylab="Hwt",
     col="green",
     main="Scatter plot",
     las=2)
#Add female
points(females$Bwt,females$Hwt,pch=8,
       xlab="Bwt",ylab="Hwt",
       col="blue",main="Scatter plot",
       las=2)
## simple linear regression analysis
?lm
malesReg<-lm(Hwt~Bwt, data=males)
abline(malesReg, col="red", lwd=2)

femalesReg<-lm(Hwt~Bwt, data=females)
abline(femalesReg, col="black", lwd=2)
summary(femalesReg)
## legend
legend("bottomright",
       legend=c("Males cats", "Females cats"),
       pch=c(8,8),
       col=c("green","blue"))
