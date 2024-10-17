# Correlation 
#### Defines the relationship between two variables that is how the two variables are linked with each other

```R
setwd("/home/paul/Downloads/R")
getwd()
list.files()
# "header=F" take 1st row as part of the observation
countMatrix=read.csv("gene_exp.csv",head=T,row.names=1,sep=",")
head(countMatrix )
dim(countMatrix)
rownames(countMatrix)
colnames(countMatrix)

## Filter out lowly expressed genes
# in this case keep genes expressed more than 5 in at least 3 samples. 
# But could be too strict
use = rowSums(countMatrix > 5) >=3
head(use)
countMatrixFiltered = countMatrix[use, ]
dim(countMatrixFiltered)

#example
mat<-matrix(c(1:12), nrow = 3, byrow=T)
mat
mat[2:3,]

#log2 transform (x+1 to avoid zeroes)
log2countMatrix = log2(countMatrixFiltered+1)
class(log2countMatrix)
t_countMat<-t(log2countMatrix)
head(t_countMat)
corr_expr<-cor(t_countMat,method="pearson")

# Get p-value
install.packages('psych')
library(psych)
p_value<-corr.test(corr_expr)$p 

### Heatmap
install.packages("corrplot")
library(corrplot)
corrplot(corr_expr)
corrplot(corr_expr, order = 'hclust', addrect = 4)
corrplot(corr_expr, method="pie")
palette = colorRampPalette(c("green", "white", "red")) (20)
heatmap(x = corr_expr, col = palette, symm = TRUE)

corrplot(corr_expr, type="upper", order="hclust", 
         p.mat = p_value, sig.level = 0.01)

corrplot(corr_expr, type="upper", order="hclust", 
         p.mat = p_value, sig.level = 0.01,insig = "blank" )
corrplot(corr_expr, type="full", order="hclust", 
         p.mat = p_value, sig.level = 0.01,insig = "blank" )
```

# Etc

```R
data("mammals")
dim(mammals)
head(mammals)
summary(mammals$body)


plot(mammals$body, mammals$brain,
     pch=16, col="blue",las=0,
     xlab="body wt", ylab="brain wt",
     las=0)
#identify
identify(mammals$body,mammals$brain,
         labels=rownames(mammals))

#log
plot(log(mammals$body), log(mammals$brain),
     pch=16, col="green",
     xlab="ln body wt", ylab="ln brain wt",
     las=0)
identify(mammals$body,mammals$brain,
         labels=rownames(mammals))
mammalsReg=lm(log(brain)~log(body),
              data=mammals)
abline(mammalsReg, col="red", lwd=2)
##############################
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
#logistic regression
Model<-glm(Death~., data=sepsis, 
           family=binomial)
summary(Model)
# regression tree
install.packages("rpart.plot")
library("rpart.plot")
data("kyphosis")
head(kyphosis)
BT<-rpart(Kyphosis~., data=kyphosis)
rpart.plot(BT, type=4, extra=1, col="blue")
#cluster
setwd("/cloud/project/data")
protein<-read.csv(file="protein.csv",
                  header = T)
head(protein,2)
rownames(protein)<-protein$X
protein<-protein[,-1]
?hclust
hc<-hclust(dist(protein), method="single")
plot(hc, hang=0)
hc2<-cutree(hc, k=3)
hc2
#heatmap
data("Animals")
head(Animals)
Animals1<-Animals[order(Animals$body),]
logbody<-log(Animals$body)
logbrain<-log(Animals$brain)
Animals2<-data.frame(logbody,logbrain)
rownames(Animals2)<-rownames(Animals1)
#dataframe change matrix
Animals3<-as.matrix(Animals2)
rc<-rainbow(nrow(Animals3), start=0, end=0.3)
cc<-rainbow(ncol(Animals3), start=0, end=0.3)
#heat map
hv<-heatmap(Animals3, col=cm.colors(5),
            scale="column",
            RowSideColors = rc,
            ColSideColors = cc,
            margins = c(10,10),
            xlab="ln WT",ylab="Animals",
            main="Heatmap")
?attitude
corr<-round(cor(attitude), 2)
head(corr)
heatmap(corr,  margins = c(8,8))
```
