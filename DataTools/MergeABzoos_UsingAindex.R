

## goals: to merge two zoos sharing same year and month but not exact same date
## 1. using one's index only
## 2. the other will have data trimmed and NAs
## 3. NAs will either filled by earlier data fromLast = FALSE or later data fromLast = TRUE



x<-zoo(1:3,as.Date(c("1992-12-13", "1997-05-12", "1997-07-13")))
y<-zoo(1:5,as.Date(c("1992-12-15", "1992-12-16", "1997-05-10","1997-05-19", "1997-07-13")))

## merge(x, y) make union of both x and y on index and data
merge(x, y, all = T) # default, union
merge(x, y, all = F) # intersection
###############################################################


## later data backward or earlier data forward
na.locf(zoo, fromLast = T/F)
#################################################


window(zoo, index(x))
## window(..., index(x)) take only index from x, 
## the place of index(x) can be replaced by any date vector
#############################################################


window(na.locf(merge(x, y), fromLast = T), index(x)) 
# fromLast = T means later value to fill the earlier value
# fromLast = F means earlier value to fill the later value
###############################################################################################


## first index of x is earlier than first index of y, so the first data of y is NA now
window(na.locf(merge(x, y), fromLast = F), index(x)) 
########################################################################################

## in practice
## 1. choose the shorter zoo over the longer zoo as index provider



