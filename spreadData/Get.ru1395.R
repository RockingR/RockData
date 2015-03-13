
#extract data of 2013
ru.1395 <- ru.excel[ , 25:27] 
head(ru.1395)
# str(ru.1395)

# check Date class or chara class
with(ru.1395, class(Date.6)) 

# turn Chara into Date class, and create a new Date class variable
ru.1395 <- within(ru.1395,  Date13 <- as.Date(Date.6, format = "%Y/%m/%d"))
str(ru.1395)

# rebuild data ru.1395 and get rid of NAs
colnames(ru.1395)
ru.1395 <- ru.1395[c("Date13", "Ru1305", "Ru1309")]
head(ru.1395)
tail(ru.1395)
View(ru.1395) # see around all the data

# to get rid of rows with NAs
ru.1395 <- na.omit(ru.1395)
save(ru.1395, file = "ru.1395.RData")
dput(ru.1395, file = "ru.1395.txt")

# turn df into zoo
library(zoo)
ru.1395.zoo <- zoo(ru.1395)
tail(ru.1395.zoo)
str(ru.1395.zoo)
save(ru.1395.zoo, file = "ru.1395.zoo.RData")
# ru.1395.zoo["Ru1305"] cannot perform like a data.frame
# rm("ru.1359", "ru.1359.zoo")
ls()
end(ru.1395.zoo)  # end(zoo) won't give the auto-correct end date if there is NAs in the end
tail(ru.1395.zoo)


# find out ru1395.spread
ru13spread <- within(ru.1395, spread1395 <- Ru1309 - Ru1305)
ru13spread <- ru13spread[c(1, 4)]
tail(ru13spread)
str(ru13spread)
save(ru13spread, file = "ru13spread.RData")
dput(ru13spread, file = "ru13spread.txt")
# check files inside directory RockData
list.files()  
ls()
