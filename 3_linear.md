# linear regression

```R
#linear
# generate random numbers
weight<-runif(10, min=1, max=5)
size<- runif(10, min=1, max=5)
height<-runif(10, min=1, max=5)
mouse.data<- data.frame(weight, size,height)
class(mouse.data)

# plot
## STEP 1: Draw a graph
plot(mouse.data$weight, mouse.data$size, pch=16, cex=2)
## STEP 2: Do the regression
simple.regression <- lm(size ~ weight, data=mouse.data)
## STEP 3: Look at the R^2, F-value and p-value
summary(simple.regression)
abline(simple.regression, lwd=5, col="red")

## Now let's do multiple regression by adding an extra term
plot(mouse.data)
## STEP 2: Do the regression
multiple.regression <- lm(size ~ weight + height, data=mouse.data)
## STEP 3: Look at the R^2, F-value and p-value
summary(multiple.regression)

```
## Regression function
```R
x=c(1:10)
y=c(12,22,20,25,30,29,34,40,50,52)
regression=function(x,y){
  x1=x-mean(x)
  y1=y-mean(y)
  #y=a+bx
  slope=sum((x1*y1))/sum((x1*x1))
  #b=sum((x1*y1))/sum((x1*x1))
  intercept=mean(y)-(slope*mean(x))
  results=as.data.frame(c())
  results[1,1]=intercept
  results[1,2]=slope
  names(results)=c("intercept","slope")
  return(results)
}
regression(x,y)
lm(y~x)
rm(list=ls())
```



## Regression (MASS)
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
```
