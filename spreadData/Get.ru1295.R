
#extract data of 2012
ru.1295 <- ru.excel[ , 21:23] 
head(ru.1295)
# str(ru.1295)

# check Date class or chara class
with(ru.1295, class(Date.5)) 

# turn Chara into Date class, and create a new Date class variable
ru.1295 <- within(ru.1295,  Date12 <- as.Date(Date.5, format = "%Y/%m/%d"))
str(ru.1295)

# rebuild data ru.1295 and get rid of NAs
colnames(ru.1295)
ru.1295 <- ru.1295[c("Date12", "Ru1205", "Ru1209")]
head(ru.1295)
tail(ru.1295)
View(ru.1295) # see around all the data

# to get rid of rows with NAs
ru.1295 <- na.omit(ru.1295)
save(ru.1295, file = "ru.1295.RData")
dput(ru.1295, file = "ru.1295.txt")

# turn df into zoo
library(zoo)
ru.1295.zoo <- zoo(ru.1295)
tail(ru.1295.zoo)
str(ru.1295.zoo)
save(ru.1295.zoo, file = "ru.1295.zoo.RData")
# ru.1295.zoo["Ru1205"] cannot perform like a data.frame
# rm("ru.1259", "ru.1259.zoo")
ls()
end(ru.1295.zoo)  # end(zoo) won't give the auto-correct end date if there is NAs in the end
tail(ru.1295.zoo)


# find out ru1295.spread
ru12spread <- within(ru.1295, spread1295 <- Ru1209 - Ru1205)
ru12spread <- ru12spread[c(1, 4)]
tail(ru12spread)
str(ru12spread)
save(ru12spread, file = "ru12spread.RData")
dput(ru12spread, file = "ru12spread.txt")
# check files inside directory RockData
list.files()  
ls()
