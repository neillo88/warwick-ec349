# Seminar 1 for Group 1

# define values
x <- 3 + sin(pi/2) 
x 
sqrt(x)
y <- sqrt(x)
z <- "word"

# define sequence:
v<- seq(1,10)
v2 <- 1:10

# define vectors
w <- c(12,1,2,3)
w
w<-sort(w)
min(w)

# use an index to learn about the particular value of w
w[2]

# multiply all values
w*2
w/2

# learn about the type and length of a vector
A <- c("1","2","5","9")
typeof(A)
n <- length(A)

# use these elements in a loop
for(i in 1:n){
  print(A[i])
}

# coercion: change the type of value stored
for(i in 1:n){
  print(as.numeric(A[i]))
}

# Use packages

#install.package("tidyverse")
library(tidyverse)

car_frame <- mpg

# basic scatter plot
ggplot(data = car_frame) +
  geom_point(mapping = aes(x=displ,y=hwy))

# let the color of the dots change by class of vehicle
ggplot(data = car_frame) +
  geom_point(mapping = aes(x=displ,y=hwy, color=class))

# add multiple plots
ggplot(data = car_frame) +
  geom_point(mapping = aes(x=displ,y=hwy)) + 
  geom_smooth(mapping = aes(x=displ,y=hwy))


  