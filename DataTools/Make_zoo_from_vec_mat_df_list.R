############################
## create single series zoo
############################
## making proper dates with as.Date(), paste(), "-"
x.date <- as.Date(paste(2003, 02, c(1, 3, 7, 9, 14), sep = "-"))
x.date
#######

## use random number rnorm() to create a vector coredata, together with date, making a zoo
x <- zoo(rnorm(5), x.date)
x

# there is no rowname for single-series zoo object
rownames(x)
colnames(x)
##########################


#############################
## create multi-series zoo from matrix
############################
## use matrix(), rnorm() to create multi-series coredata
## use 1:5, 3:7 to create integer dates or integer index for zoo
## zoo object when they were made were not given colnames automatically
y1 <- zoo(matrix(1:10, ncol = 2), 1:5)
y1
rownames(y1) # there is no rowname for multi-series zoo object
colnames(y1) # there is no colnames
index(y1) # can be set to integer as well
y2 <- zoo(matrix(rnorm(10), ncol = 2), 3:7)
y2
#################################################################



#################################################3
## use dataframe to create multi-series zoo
############################################################3
# cos dataframe, coredata of zoo will have column names
# better to give names, as auto names are bad
temp <- data.frame(1:5, 6:10)
z <- zoo(temp, LETTERS[1:5])
z
temp1 <- data.frame(a = 1:5, b = 6:10)
z <- zoo(temp1, letters[1:5])
z
##########################################


temp <- list(a = 1:5, b = 6:10, c = c(F, T, T, F, F))
temp <- as.data.frame(temp, row.names = NULL, stringsAsFactors = F)
temp
str(temp)
rownames(temp)
rownames(temp) <- NULL
names(temp)
list.z <- zoo(temp, LETTERS[-(1:21)])
str(list.z)
list.z

## use list to create multi-series zoo
######################################################################################
## if coredata include other class other than numeric...
## if including character class, then all numeric data will be coerced into characters
## if including logical class, then all the logical class will be coerced into numeric
######################################################################################