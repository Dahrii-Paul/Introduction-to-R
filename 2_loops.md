# Loops Repeat Actions
# if else if
```R
a<-6
if(a>5){
  print("a is greater than 5")
}else if (a==5){
  print("a is equal to 5 ")
}else{
  print("a is less than 5")
}

```
# read user input
```R
# greater-than >
# less-than <
age<-as.integer(readline(prompt = "Enter the age: "))
if(age<=10){
  print("kids")
}else{
  print("adult")
}

```
# switch statement
```R
vtr<-c(1,2,3,4,5)
option<-readline(prompt = "Enter the option: ")
switch (option,
        "mean"=print(mean(vtr)),
        "median"=print(median(vtr)),
        "min"=print(min(vtr))
)
```
# loops repeat
```R
x=2
repeat{
  x=x^2
  print(x)
  if(x>15)
    break
}
```
# While
```R
while(x<100){
  x=x^2
  print(x)
}
```
# for
```R
for (i in 1:15) {
  if((i%%2)==0){
    next
  }
  print(i)
}
```
