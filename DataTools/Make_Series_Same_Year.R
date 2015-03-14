## clear the workspace
ls()
rm(list = ls())
##############################


## load the data for use
getwd()
setwd()
list.files()
load("z07-15sp.equal.RData")
load("Ru07-15Spread.Rdata")
################################


str(ru07spread)
with(ru07spread, zoo(spread0795, Date07))
with(ru08spread, zoo(spread0895, Date08))

## if we have two dataframe object, a and b;
## then, we need b's index to share the same year with a's 
## what shall we do?
## solution: 
## 1. make b's index (ru08spread's Date08) into character
## 2. using gsub() to change b's index (all 2007-2008 into 2006-2007)
temp08 <- within(ru08spread, Date08 <- gsub("2007", "2006", as.character(Date08)))
# str(temp08)
temp08 <- within(temp08, Date08 <- gsub("2008", "2007", as.character(Date08)))
# str(temp08)

## 3. change both a and b (ru07spread and new ru08spread) into zoo objects
temp07.z <- with(ru07spread, zoo(spread0795, Date07))
temp08.z <- with(temp08, zoo(spread0895, as.Date(Date08)))
str(temp07.z)
str(temp08.z)
# now both series of data share the same year 

## now merge both data with NA fromLast or not
window(na.locf(merge(x, y), fromLast = TRUE), index(x))
temp0708.z <- window(na.locf(merge(temp07.z, temp08.z), fromLast = T), index(temp07.z))
str(temp0708.z)
