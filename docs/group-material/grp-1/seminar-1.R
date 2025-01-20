# Delete everything
rm(list = ls())

################################################################################
# R-Basics
################################################################################

## Define a single value:

x <- 3 + sin(pi/2)
x
sqrt(x) #Note, this does NOT create a new stored value
y <- sqrt(x) #This DOES create a new stored value

pishort <- round(pi, 4)

z <- "word"
z

## Define sequences, vectors, and matrices:

### Sequences
v <- seq(1,10)
v
v2 <- 1:10
t(v)
t(t(v))

### Combine (in vector or list)
w <- c(12,1,2,3) #i.e., winter-months
sort(w)
w # Main object has not changed
min(w)
t(w)
t(t(w))

### Apply operation to all elements
w2 <- c(-1,0,2,3) *2
w2

w2 / 0

### Matrices: appears as data, not value
W <- matrix(w) 
print(W)
t(W)

W2 <- cbind(w,w2) 
W2
rbind(w,w2)

### vectors have two properites: length and type

typeof(1:10)
typeof(seq(1,10))
typeof(v)
length(v)

### coercion: converting from one type to another
nums <- c("1", "2", "3")
typeof(nums)
nums
nums1 <- as.integer(nums) #note: you can use similar functions such as as.numeric, as.character
typeof(nums1)
nums1
nums2 <- as.numeric(nums)
typeof(nums2)
nums2

### named vectors
named <- c(x=1, y=2, z=4)
named

### specific position within a vector
x <- c("one", "two", "three", "four", "five")
x[c(3, 2, 5)]
x[c(-3, -4)]

### proportion of non-missing values
x<-c(10, 3, NA, 5, 8, 1, NA)
mean(!is.na(x))


## Lists

x <- list("a", "b", 1:10)
length(x)
typeof(x)
x[[1]]
x[[3]]
typeof(x[[1]])
typeof(x[[3]])

### lists can be recursive
z <- list(list(1,2), list(3,4))

### subsetting a list
check <- list(a=1:3, b="a string", c=pi, d=list(-1,5))

check[1:2]

### [[]] removes hierarchy from a list
another_list <- check[[4]]
another_list[1] 
another_list[[1]] 

################################################################################
# Packages
################################################################################

## Install packages
#install.package(tidyverse) # designed for "tidy" data

## Load library
library(tidyverse) # includes ggplot

#Do cars with big engines use more fuel than cars with small engines?

#loading mpg data frame
car_frame <- mpg

#hwy measures fuel efficiency on a highway (miles per gallon) and displ measures engine displacement (in litres)

ggplot(data = car_frame) + 
  geom_point(mapping=aes(x=displ, y=hwy))

#ggplot alone gives us an empty graph, just indicating the dataset to be used

ggplot(data = car_frame)

#we add layers on top, geom_point adds a layer of points

#mapping is always paired with an aesthetic  

#aesthetic is a visual property of plotted objects (axis, size, color, symbol)

#ggplot(data=<DATA>) + <GEOM FUNCTION>(mapping=aes(<MAPPINGS>))

ggplot(data = car_frame) + 
  geom_point(mapping=aes(x=displ, y=hwy))

#aesthetics of different points can be conditional on values of variables in the dataset

#plot different classes of cars using different colors

ggplot(data = mpg) + 
  geom_point(mapping=aes(x=displ, y=hwy, color=class))

#we can match class to size of the points, though it doesn't look pretty

ggplot(data = mpg) + 
  geom_point(mapping=aes(x=displ, y=hwy, size=class))

#alpha for transparency, shape (careful, MAX 6 shapes at a time by default)

ggplot(data = mpg) + 
  geom_point(mapping=aes(x=displ, y=hwy, shape=class))

#note x and y are aesthetics too (related to location) 

#you can set aesthetics manually, let's make all points blue -> IT GOES OUTSIDE AES

ggplot(data = car_frame) + 
  geom_point(mapping=aes(x=displ, y=hwy), color="blue")

#color and continuous variables

ggplot(data = mpg) + 
  geom_point(mapping=aes(x=displ, y=hwy, color=cty))

#conditional aesthetic

ggplot(data = mpg) + 
  geom_point(mapping=aes(x=displ, y=hwy, color=displ<5))

#facets (separate plots for different categories of data)

ggplot(data = mpg) + 
  geom_point(mapping=aes(x=displ, y=hwy)) +
  facet_wrap(~ class, nrow=2)

#facets with multiple variables

ggplot(data = mpg) + 
  geom_point(mapping=aes(x=displ, y=hwy)) +
  facet_grid(drv ~ cyl)

#geoms are geometrical objects that a plot uses to represent data

#all geoms take a mapping argument, but not every aesthetic works with every geom

#geom smooth adds a regression line to the plot

ggplot(data = car_frame) +
  geom_smooth(mapping = aes(x=displ, y=hwy))

#we can very linetype by drivetrain
#note on drivetrains: f = front-wheel drive, r = rear wheel drive, 4 = 4wd

ggplot(data = car_frame) +
  geom_smooth(mapping = aes(x=displ, y=hwy, linetype=drv))

#for geoms where data is summarized by one object (such as a line) you can create subplots by grouping on a variable (it does not add a legend)

ggplot(data = car_frame) +
  geom_smooth(mapping = aes(x=displ, y=hwy, group=drv))

#we can display two geoms in the same plot

ggplot(data = car_frame) +
  geom_point(mapping=aes(x=displ, y=hwy)) +
  geom_smooth(mapping=aes(x=displ, y=hwy))

#global mappings vs local mappings

ggplot(data = car_frame, mapping=aes(x=displ, y=hwy)) +
  geom_point() +
  geom_smooth(color="red")

# you can use different data for each layer (also LOCAL overrides GLOBAL)

ggplot(data = car_frame, mapping=aes(x=displ, y=hwy)) +
  geom_smooth(
    se = FALSE
  ) +
  geom_smooth(
    data = filter(car_frame, class == "subcompact"),
    color="red",
    se = FALSE
  )

#Basic bar graph

ggplot(data = car_frame) +
  geom_bar(mapping = aes(x=drv))


## Load library
library(dplyr) 
# https://dplyr.tidyverse.org/
# comes installed in tidyverse
# otherwise install.package(dplyr) 

### Main functions: mutate, select, filter, summarize, arrange

### Filter
suv <- filter(car_frame,class=="suv")

### Select - specific variables
suv <- select(suv,hwy,cty,displ,drv)

### Mutate - transform/add existing variables
suv <- mutate(suv,ratio = cty/hwy,hwy_d = hwy/displ,cty_d = cty/displ)

  # see also, transmute() to keep only new variables

summarize(suv, avg_cty=mean(cty, na.rm = TRUE))

suv_bydrv <- group_by(suv, drv)

summarize(suv_bydrv, cat_m=mean(cty_d, na.rm = TRUE))

drv_stats <- summarize(suv_bydrv, 
                       count=n(),
                       cty_d=mean(cty_d, na.rm = TRUE),
                       hwy_d=mean(hwy_d, na.rm = TRUE)
                       ) 

ggplot(data=drv_stats, mapping=aes(x=cty_d, y=hwy_d)) +
  geom_point(aes(size=count)) 



#it is more efficient to perform the same using pipe %>% 

drv_stats2 <- car_frame %>% 
  filter(class=="suv") %>%
  mutate(ratio = cty/hwy,hwy_d = hwy/displ,cty_d = cty/displ) %>%
  group_by(drv) %>%
  summarize( 
            count=n(),
            cty_d=mean(cty_d, na.rm = TRUE),
            hwy_d=mean(hwy_d, na.rm = TRUE)
  ) 




