## how to merge a number of series which stored in a list


## create a dataframe with multi-variables and factors
m <- 5 # no of years
n <- 6 # no of sites
sites <- LETTERS[1:n]
set.seed(1)
DF <- data.frame(site = sites, year = 2000 + 1:m, data = rnorm(m*n)) # create a dataframe with variables on year and letters as factors potentially
DF
#####################################################3

## based on a factor category to split a multi-variable dataframe into a list of dataframe
split(DF, DF$site) # split a dataframe into 6 dataframes by sites -- a list of 6 dataframes
##########################################################################################

## turn the list of dataframe into a list of zoos
tozoo <- function(x) zoo(x$data, x$year) # build a function to turn dataframe into a zoo (only data and year)
# turn 6 dataframe into zoos with tozoo function -- a list of 6 zoos
# the index will automatically order themselves even when they were in irregular order in dataframe
lapply(split(DF, DF$site), tozoo) 
##################################################################################################

## merge multiple zoos stored in a list together
# do.call help function (unable list) to work on data in list
do.call(merge, lapply(split(DF, DF$site), tozoo)) 
Data <- do.call(merge, lapply(split(DF, DF$site), tozoo)) # now we have a zoo with 6 data variables
###############################################################################