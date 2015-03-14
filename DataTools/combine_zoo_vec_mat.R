##############################################################
## How to zoo with vector, matrix and dataframe?
## given there is no need to change the index/date
########################################################

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
vct <- 9:11
mat <- matrix(12:17, ncol = 2)
colnames(mat) <- c("a", "b")
rownames(mat)
df <- data.frame(a = 1:3, b = 4:6)
df
rownames(df) <- NULL
rownames(df)


## combine a zoo with vector -- it works
merge(a, vct)
merge(a, coredata(b)[1:3], 3)

## combine a zoo with a matrix-- it works
## make sure the coredata have the same length
merge(y1, coredata(y2),  1)
merge(x, coredata(y1)[1:3,], 2)
merge(x, mat)


#########################################################################################
## combine a zoo with a df  -- it does not work
## when merge zoo and df, df's rownames will act as index from 1970-01-01 + 1:3
## df has rownames, and seems difficult to make NULL, so df cannot be combined through merge
merge(a, df)


#################################################################
## cbind() combine a zoo with vectors(without date)
## 1. use cbind
## 2. only vectors not dataframes
################################################################

## get data ready
# x is a zoo with three dates
# y is a zoo with five dates
# they are of different dates around
x<-zoo(1:3,as.Date(c("1992-12-13", "1997-05-12", "1997-07-13")))
y<-zoo(1:5,as.Date(c("1992-12-15", "1992-12-16", "1997-05-10","1997-05-19", "1997-07-13")))
z <- 9:11
###############################################################################################3


## try to locate the closest date and data for combining
## given two series of dates A and B, and choose the A date and check which date in the series is closest to the A date
## f is a function which should process a value rather than a vector
f <- function(u) which.min(abs(as.numeric(index(y)) - as.numeric(u))) # index(y) is a vector, u is supposed to be a single value 
ix <- sapply(index(x), f) 
# because data is stored in a vector, sapply() help f to process a value at a time, rather than process a whole vector
##################################################################################################33

## cbind can combine zoo and vector, and matrix
cbind(x, y = coredata(y)[ix]) # use cbind to combine a zoo with a vector 
cbind(x, y = matrix(1:6, ncol = 2)) # cbind works for zoo and matrix
cbind(x, y = coredata(y)[ix], z) # cbind(zoo, vec, vect) it is working
########################################################################


# cbind(zoo, dataframe) is not working 
data.frame(y = coredata(y)[ix], z = z)
cbind(x, data.frame(y = coredata(y)[ix], z = z)) 
######################################################################################################
