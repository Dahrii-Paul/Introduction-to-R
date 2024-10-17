#---------------Operators---------------#
# a). Assignment Operators
x = 5 
x <- 5 
x <<- 5 
x <- x + 3 
3 -> y 
3 ->> y


# b) Arithmetic Operators
a <- 2;a
b <- 3;b
c <- a + b;c # c will return 5
d <- a - b;d # d will return -1
e <- a * b;e # e will return 6
f <- a / b;f # f will return 0.66667
g <- a^b;g  # g will return 8
h <- 7 %/% 2;g # h will return 3
i <- 7 %% 2;i # i will return 1

# c). Relational Operators
2<3	#TRUE
2>3	#FALSE
2>=3	#FALSE
2<=3	#TRUE
2==2	#TRUE
2!=2	#TRUE

# d). Logical Operators
2<3	#TRUE
2>3	#FALSE
2>=3	#FALSE
2<=3	#TRUE
2==2	#TRUE
2!=2	#TRUE

#d). Logical Operators
a <- 5
b <- 10
ifelse(a > 3 & b < 15,
       "Both conditions are true", "Either condition is false") 

ifelse(a < 3 | b > 15,
       "Either conditions are true", "Both condition are false")

ifelse(!(a > 3 & b < 15),"Either condition is false", 
       "Both conditions are true") 

# e). Special Operators
?vector
x=1:3
x=1:3;y=2;y%in%x

#---------------Basic Data Structures---------------#
# a) Vectors

#Create a numeric vector
v1<-c(1,2,3,4,5,6)
v1
#Create a numeric vector using c(range)
v2<-c(5:11)
v2
#Create a string vector
v3 <- c("A","A","G","T","C","G")
v3
#Create mix vector type
v_mix <- c("new",1,2,3,"four")
v_mix 
#Create an integer vector
v4<-c(8L,16L,64L,128L)
v4

# b) Factors
v5 <- as.factor(v3) 
v5

# c) Array
array_1<-array(c(v1))
array_1
class(array_1)
#Create an Array 2-D
array_2<-array(1:12,c(4,3))
array_2
#Create multiple-D array
array_multi<- array(1:24,c(3,4,3))
array_multi

# d) Matrices
length(v1)
#Copy the vector
mat1 <- v1
dim(mat1) <- c(3,2);mat1
mat2 <- cbind(v1,v2)
mat2
mat3 <- rbind(v1,v2)
mat3
#Create a matrix using ‘matrix’ function
mat4 <-  matrix(c(v1, v2), nrow = 6, ncol = 2)
mat4
# Create a matrix – by range
mat5 <- matrix(c(1:5), nrow = 4, ncol = 4)
mat5
mat5 <- matrix(c(1:5), nrow = 4, byrow = TRUE)
mat5

# e)	Lists
ls1 <- list(v1,v2,v3,v4,array_1,array_2,array_multi,mat1,mat2,mat3,mat5)
ls1[[3]]
ls1[[6]][2,2]

# f)	Data Frame
dim(mat4);length(v3)
df1 <-data.frame(mat4,v3)
df1
colnames(df1)[1:3] <- c("var1","var2","DNA")
colnames(df1)
names(df1)[1] <- "col1"
colnames(df1)

#---------------Data Wrangling---------------#
#install.packages("MASS")
library(MASS)
data(package = "MASS")
data(cats)
head(cats)
tail(cats)
dim(cats)
str(cats)
glimpse(cats)
summary(cats)
# Select subset
cats[,1]
cats$Sex
cats$Sex[1]
males <- subset(cats, cats$Sex == "M")
females <- subset(cats, cats$Sex == "F")
summary(males)
summary(females)
sd(males$Hwt)
cats1 <-cats
cats1$Sex <- as.character(cats1$Sex)
str(cats1)
cats1$Sex[cats1$Sex == "F"] = 1
cats1$Sex[cats1$Sex == "M"] = 2
table(cats$Sex)

# Join and Merge
df1 <- data.frame(id = c(1,2,3,4), name = c("potein1", "potein2", "potein3","potein4"))
df2 <- data.frame(id = c(2,3,4,5), a.site = c(25, 30, 35, 40))
#Function merge()
merged_df <- merge(df1, df2, by = "id", all.x = TRUE)
merged_df
merged_df <- merge(df1, df2, by = "id", all.x = FALSE)
merged_df
#Function full_join() 
library(dplyr)
full_df <- full_join(df1, df2, by = "id")
full_df
#Function left_join() 
left_df <- left_join(df1, df2, by = "id")
left_df
# Function right_join() 
right_df <- right_join(df1, df2, by = "id")
right_df
#Function semi_join() i.e. either for df1 or df2
semi_df <- semi_join(df1,df2, by = "id")
semi_df
#Function anti_join()
anti_df <- anti_join(df1, df2, by = "id")
anti_df
#Function inner_join()
inner_df <- inner_join(df1, df2, by = "id")
inner_df

# load the data
library(dplyr)
df <- read.csv("https://raw.githubusercontent.com/Dahrii-Paul/R_Basic/d1f0be2d9bc12bfd1df3093723db9c40f8865a78/adult.csv")
head(df,2)
# a)	Function ‘filter()’ 
colnames(df)
df$native.country <- as.factor(df$native.country)
levels(df$native.country)
filter(df, native.country %in% "Scotland")
filter(df,native.country %in% c("Scotland","Honduras"))
filter(df,native.country %in% c("Scotland","Honduras"), hours.per.week > 50 )
# b)	Function  ‘select()’ 
dplyr::select(df, age, income)
dplyr::select(df, -age, -income)
# c) Pipe operator %>%
df %>% 
  filter(native.country %in% c("Scotland","Honduras"), sex == "Male", hours.per.week > 50) %>% 
  select(age, native.country, sex, hours.per.week)
#Summary
df %>%
  select(-workclass, -education, -occupation, -marital.status, -relationship,-race,-sex, -native.country, -income) %>%
  summarise_all(list(mn=mean, stdev=sd))
#Group Level
df %>%
  select(age, race, sex, hours.per.week) %>%
  group_by(race)%>%
  summarise(sampSz=n(), Avg =mean(hours.per.week), stDev = sd(hours.per.week))
#Sub-setting data "native.country" sample size
df2 <-df %>%
  select(age, native.country, sex, hours.per.week) %>%
  group_by(native.country)%>%
  mutate(samplSz=n())%>%
  filter(samplSz >50) %>%
  ungroup()
df2

#---------------Data Visualization---------------#
#Function plot()
x <- c(1:10);x
y <- seq(21, 40, 2);y

par(mfrow = c(2,3), oma= c(2,0,4,0))
plot(x, y, pch = 1, col = "red", type = "p", xlab = "hight",  ylab  = "weight", 
     main = "Scatter Plot", sub = "H/w", las = 0, cex.axis = 1.0, cex.lab = 1.0)

plot(x, y, pch = 2, col = "blue", type = "l", xlab = "hight",  ylab  = "weight", 
     main = "Scatter Plot", sub = "H/w",las = 1, cex.axis = 0.8, cex.lab = 1.0)

plot(x, y, pch = 3, col = "yellow", type = "b",xlab = "hight",  ylab  = "weight", 
     main = "Scatter Plot", sub = "H/w", las = 2, cex.axis = 1.5, cex.lab = 1.0)

plot(x, y, pch = 4, col = "green", type = "p", xlab = "hight",  ylab  = "weight", 
     main = "Scatter Plot", sub = "H/w",las = 3, cex.axis = 1.0, cex.lab = 1.0)

plot(x, y, pch = 5, col = "purple", type = "o", xlab = "hight",  ylab  = "weight", 
     main = "Scatter Plot", sub = "H/w", las = 0, cex.axis = 1.2, cex.lab = 1.0)

plot(x, y, pch = 6, col = "orange", type = "s", xlab = "hight",  ylab  = "weight", 
     main = "Scatter Plot", sub = "H/w", las = 0, cex.axis = 1.0, cex.lab = 1.0)
title(main = "Scatter Plots",outer = T)
dev.off()

library(MASS)
data(cats)
males <- subset(cats, cats$Sex == "M")
females <- subset(cats, cats$Sex == "F")

plot(males$Bwt,males$Hwt, 
     pch = 8, 
     xlab = "Bwt", ylab = "Hwt",
     col = "green", main = "scatter plot", las =0)
points(females$Bwt,females$Hwt, 
       pch = 8, 
       xlab = "Bwt", ylab = "Hwt",
       col = "blue", main = "scatter plot", las =0)

malesReg <- lm(Hwt ~ Bwt ,data = males)
abline(malesReg, col = "red" , lwd = 2)
femaleReg <- lm(Hwt ~ Bwt,data = females)
abline(femaleReg, col = "black",lwd =2)
legend("bottomright",legend = c("Males cats","Female cats"), 
       pch = c(8,8), col = c("green","blue"))

# Identify point using name
data(mammals)
plot(mammals$body,mammals$brain , 
     pch =  16, 
     col = "blue", 
     las = 0, 
     xlab = "body weight in Kg",ylab = "brain weight in gm")
identify(mammals$body,mammals$brain, labels = rownames(mammals))

#boxplot
library(MASS)
data(cats)
boxplot(cats$Bwt,cats$Hwt, col = "pink", ylab = "residues", main = "box plot")
