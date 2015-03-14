
#extract data of 2009
ru.0995 <- ru.excel[ , 9:11] 
head(ru.0995)
str(ru.0995)

# check Date class or chara class
with(ru.0995, class(Date.2)) 

# turn Chara into Date class, and create a new Date class variable
ru.0995 <- within(ru.0995,  Date09 <- as.Date(Date.2, format = "%Y/%m/%d"))
str(ru.0995)

# rebuild data ru.0995 and get rid of NAs
colnames(ru.0995)
ru.0995 <- ru.0995[c("Date09", "Ru0905", "Ru0909")]
head(ru.0995)
tail(ru.0995)
View(ru.0995) # see around all the data

# to get rid of rows with NAs
ru.0995 <- na.omit(ru.0995)
save(ru.0995, file = "ru.0995.RData")
dput(ru.0995, file = "ru.0995.txt")

# turn df into zoo
library(zoo)
ru.0995.zoo <- zoo(ru.0995)
tail(ru.0995.zoo)
str(ru.0995.zoo)
save(ru.0995.zoo, file = "ru.0995.zoo.RData")
# ru.0995.zoo["Ru0905"] cannot perform like a data.frame
# rm("ru.0959", "ru.0959.zoo")
ls()
end(ru.0995.zoo)  # end(zoo) won't give the auto-correct end date if there is NAs in the end
tail(ru.0995.zoo)
ru.spread09.zoo <- 
# find out ru0995.spread
ru09spread <- within(ru.0995, spread0995 <- Ru0909 - Ru0905)
ru09spread <- ru09spread[c(1, 4)]
tail(ru09spread)
str(ru09spread)
save(ru09spread, file = "ru09spread.RData")
dput(ru09spread, file = "ru09spread.txt")
# check files inside directory RockData
list.files()  
ls()
