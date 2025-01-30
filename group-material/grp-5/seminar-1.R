# Seminar 1, Group 5

x <- 3 + sin(pi/2)
sqrt(x)
y <- sqrt(x)
w <- "2"
typeof(w)
v <- as.numeric(w)

# sequences

m <- seq(1,10)
n <- seq(0,10,2)
o <- 1:10

for(i in 1:10) {
  print(i)
}

# vectors
A <- c("1", "2", "5", "9")
typeof(A)
length(A)
n <- length(A)
for(i in 1:n) {
  print(as.numeric(A[i]))
}

## Packages
#install.packages("tidyverse")
library(tidyverse)

car_frame <- mpg
ggplot(data = car_frame) + 
  geom_point(mapping = aes(x=displ,y=hwy))

ggplot(data = car_frame) + 
  geom_point(mapping = aes(x=displ,y=hwy, color=class))

ggplot(data = car_frame) + 
  geom_point(mapping = aes(x=displ,y=hwy)) +
  geom_smooth(mapping = aes(x=displ,y=hwy))

ggplot(data = car_frame, mapping = aes(x=displ,y=hwy)) + 
  geom_point() +
  geom_smooth()


