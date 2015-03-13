
#extract data of 2010
ru.1095 <- ru.excel[ , 13:15] 
head(ru.1095)
str(ru.1095)

# check Date class or chara class
with(ru.1095, class(Date.3)) 

# turn Chara into Date class, and create a new Date class variable
ru.1095 <- within(ru.1095,  Date10 <- as.Date(Date.3, format = "%Y/%m/%d"))
str(ru.1095)

# rebuild data ru.1095 and get rid of NAs
colnames(ru.1095)
ru.1095 <- ru.1095[c("Date10", "Ru1005", "Ru1009")]
head(ru.1095)
tail(ru.1095)
View(ru.1095) # see around all the data

# to get rid of rows with NAs
ru.1095 <- na.omit(ru.1095)
save(ru.1095, file = "ru.1095.RData")
dput(ru.1095, file = "ru.1095.txt")

# turn df into zoo
library(zoo)
ru.1095.zoo <- zoo(ru.1095)
tail(ru.1095.zoo)
str(ru.1095.zoo)
save(ru.1095.zoo, file = "ru.1095.zoo.RData")
# ru.1095.zoo["Ru1005"] cannot perform like a data.frame
# rm("ru.1059", "ru.1059.zoo")
ls()
end(ru.1095.zoo)  # end(zoo) won't give the auto-correct end date if there is NAs in the end
tail(ru.1095.zoo)


# find out ru1095.spread
ru10spread <- within(ru.1095, spread1095 <- Ru1009 - Ru1005)
ru10spread <- ru10spread[c(1, 4)]
tail(ru10spread)
str(ru10spread)
save(ru10spread, file = "ru10spread.RData")
dput(ru10spread, file = "ru10spread.txt")
# check files inside directory RockData
list.files()  
ls()
