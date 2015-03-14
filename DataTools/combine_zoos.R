########################################################################################
## combine two zoos with union or intersection
## union: all = T or default
## intersection: all = F
## if both zoos have no colnames, use suffixes = c("a", "b") to give new zoo colnames
## if union, then there will more likely to be missing data, use fill = 0 or NA(default) to fill missing data
##########################################################################################

## get data ready
a <-zoo(1:3,as.Date(c("1992-12-13", "1997-05-12", "1997-07-13")))
b.date <- as.Date(paste(2003, 02, c(1, 3, 7, 9, 14), sep = "-"))
b.date
b <- zoo(rnorm(5), x.date)
x<-zoo(1:3,as.Date(c("1992-12-13", "1997-05-12", "1997-07-13")))
y<-zoo(1:5,as.Date(c("1992-12-15", "1992-12-16", "1997-05-10","1997-05-19", "1997-07-13")))
z <- 9:11
y1 <- zoo(matrix(1:10, ncol = 2), 1:5)
y2 <- zoo(matrix(rnorm(10), ncol = 2), 3:7)

## when combine two zoos, though both zoos have no colnames, but new zoo will use object names
## y1 and y2 will be used for colnames of new zoo
merge(y1, y2, all = FALSE) # all = F makes intersection;  
m1 <- merge(y1, y2, all = FALSE) 
colnames(m1) 

## if not like object names to be colnames, you can set by suffixes = c("a", "b")
merge(y1, y2, all = FALSE, suffixes = c("a", "b")) 
## of course, if y1 and y2 have colnames, then new zoo will inherit the colnames

## make union of two zoos and filling the missing data
merge(y1, y2, all = TRUE) # all = T create union, also missing data into NAs
merge(y1, y2, all = TRUE, fill = 0) # fill = 0 to fill NAs as 0s
########################################################################################



## if different index classes are merged, the indexes are coerced into date (integer + 1970-01-01)
## It is up to the user to ensure that the result makes sense.
merge(x, y1, y2, all = TRUE)
m2 <- merge(x, y1, y2, all = TRUE)
str(index(m2)) # mixed class will be coerced into date class
####################################################################################################
