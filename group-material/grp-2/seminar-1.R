# Seminar 1, Group 2

# Basics of R

## Define values

x <- 3 + sin(pi/2)
x
sqrt(x)
y <- sqrt(x)
z <- "word"

## sequence
v <- seq(1,10)
v2 <- 1:10

## vectors/collections
w <- c(12,1,2,3)
typeof(w)
length(w)

## Loop
A <- c("1","2","5","8")
typeof(A)
n <- length(A)
for(i in 1:n){
  print(A[i])
}

## coercion
for(i in 1:n){
  print(as.numeric(A[i]))
}
## also see as.integer or as.character
A <- as.numeric(A)

## Part 2: packages
#install.package("tidyverse")
library(tidyverse)

car_frame <- mpg

ggplot(data=car_frame) +
  geom_point(mapping = aes(x=displ,y=hwy))

ggplot(data=car_frame) +
  geom_point(mapping = aes(x=displ,y=hwy,color=class))


