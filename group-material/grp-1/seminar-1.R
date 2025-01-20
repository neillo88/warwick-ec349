# Seminar 1 for Group 1

x <- 3 + sin(pi/2) 
x 
sqrt(x)
y <- sqrt(x)
z <- "word"

## Sequence:
v<- seq(1,10)
v2 <- 1:10

## vectors
w <- c(12,1,2,3)
w
w<-sort(w)

min(w)
# second value of w
w[2]

# multiply all values
w*2
# likewise
w/2

#
A <- c("1","2","5","9")
typeof(A)
n <- length(A)

for(i in 1:n){
  print(A[i])
}

for(i in 1:n){
  print(as.numeric(A[i]))
}


## Packages
#install.package("tidyverse")
library(tidyverse)

car_frame <- mpg

ggplot(data = car_frame) +
  geom_point(mapping = aes(x=displ,y=hwy))

ggplot(data = car_frame) +
  geom_point(mapping = aes(x=displ,y=hwy, color=class))

ggplot(data = car_frame) +
  geom_point(mapping = aes(x=displ,y=hwy)) + 
  geom_smooth(mapping = aes(x=displ,y=hwy))


  