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
```
####  "lty" Line type
#### "las" labels are parallel (=0) or perpendicular(=2) to axis
####  "lwd" Specifies the line width
####  "pch" 
#### "par" accomodate several graph
#### "cex" number indicating the amount by which plotting text and symbols should be scaled </br>
     relative to the default. 1=default, 1.5 is 50% larger, 0.5 is 50% smaller, etc.
```R
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
