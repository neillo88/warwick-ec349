# Seminar 1, group 4

# defining values

x <- 3 + sin(pi/2)
sqrt(x)
x <- sqrt(x)

w <- "2"
v <- "word of the day"

w <- as.numeric(w)
# also see as.character as.integer

# sequences
g <- seq(1,10)
h <- 1:10

for(i in 1:10) {
  print(i)
}

# vectors
a <- c(12,1,2,3) 
a[3]
sort(a)
b <- sort(a)  
b[3]  

typeof(a)
length(a)

n <- length(a)
for(i in 1:n){
  print(a[i])
}

## Working with packages
# install.packages("tidyverse")
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
