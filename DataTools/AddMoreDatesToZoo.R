## how to make a zoo's index(irregular not fulfilled) to be full
## in orther words, how to combine irregular index with full index without change coredata?
## solution:
## 1. combine zoo with empty zoo (with full index)
## 2. form a zoo with full index but NAs 
## 3. na.locf()

## na.rm = T to remove the first leading NAs
na.locf(object, na.rm = T, fromLast = T)

## extend an irregular series to a regular one:
## create a constant series as zoo coredata
seq(4)
seq(4)[-2]
zoo(1, seq(4)) # set coredata to be 1 constant
z <- zoo(1, seq(4)[-2])
z  # irregular series = index(integer or date) is not continuous, there is jump 1, 3, 4 as example
##############################################################################################


## create an empty zoo with only index 
## create a 0 dimensional zoo series
z0 <- zoo(, 1:4)
z0 # empty zoo as a whole not displayed, but data and index seperately
################################################################


## when merge with an empty zoo, two merge partners become one;
## indexes merge, and coredata merge too
## all = T, fill = NA are default
merge(z, z0) # all = T is default
merge(z, z0, fill = 0) # fill with 0s
##############################################################