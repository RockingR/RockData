## 1. get data from excel
tempt <- read.table(file = "clipboard", sep = "\t", header = T, stringsAsFactors = FALSE)
ru.excel <- tempt
setwd("C:/Users/Natusme/Desktop/RockData")
save(ru.excel, file = "ru.excel.RData")
dput(ru.excel, file = "ru.excel.txt")

rm(list = ls())
load("ru.excel.RData")
ls()

head(ru.excel[1:4])
# head(ruSpread.data)
# str(ruSpread.data)
# names(ruSpread.data)

# ruSpread.data

################################################################
##################################################################
## 2. verify data and turn into what you want -------------------------

# check content
head(ru.excel) # how it looks
str(ru.excel) # check df
colnames(ru.excel)
rownames(ru.excel)
rownames(ru.excel) <- NULL  # it seems not working?????????????

#extract data of 2007
ru.0795 <- ru.excel[ , 1:3] 
head(ru.0795)
str(ru.0795)

# check Date class or chara class
with(ru.0795, class(Date)) 

# turn Chara into Date class, and create a new Date class variable
ru.0795 <- within(ru.0795,  Date07 <- as.Date(Date, format = "%Y/%m/%d"))
str(ru.0795)

# rebuild data ru.0795 and get rid of NAs
colnames(ru.0795)
ru.0795 <- ru.0795[c("Date07", "Ru0705", "Ru0709")]
head(ru.0795)
tail(ru.0795)
# to get rid of rows with NAs
ru.0795 <- na.omit(ru.0795)
save(ru.0795, file = "ru.0795.RData")
dput(ru.0795, file = "ru.0795.txt")

# turn df into zoo
library(zoo)
ru.0795.zoo <- zoo(ru.0795)
tail(ru.0795.zoo)
str(ru.0795.zoo)
save(ru.0795.zoo, file = "ru.0795.zoo.RData")
# rm("ru.0759", "ru.0759.zoo")
ls()
end(ru.0795.zoo)  # end(zoo) won't give the auto-correct end date if there is NAs in the end
tail(ru.0795.zoo)

# find out ru0795.spread
ru07spread <- within(ru.0795, spread0795 <- Ru0709 - Ru0705)
ru07spread <- ru07spread[c(1, 4)]
tail(ru07spread)
str(ru07spread)
save(ru07spread, file = "ru07spread.RData")
dput(ru07spread, file = "ru07spread.txt")
# check files inside directory RockData
list.files()  
ls()

