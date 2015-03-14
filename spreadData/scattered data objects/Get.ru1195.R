
#extract data of 2011
ru.1195 <- ru.excel[ , 17:19] 
head(ru.1195)
str(ru.1195)

# check Date class or chara class
with(ru.1195, class(Date.4)) 

# turn Chara into Date class, and create a new Date class variable
ru.1195 <- within(ru.1195,  Date11 <- as.Date(Date.4, format = "%Y/%m/%d"))
str(ru.1195)

# rebuild data ru.1195 and get rid of NAs
colnames(ru.1195)
ru.1195 <- ru.1195[c("Date11", "Ru1105", "Ru1109")]
head(ru.1195)
tail(ru.1195)
View(ru.1195) # see around all the data

# to get rid of rows with NAs
ru.1195 <- na.omit(ru.1195)
save(ru.1195, file = "ru.1195.RData")
dput(ru.1195, file = "ru.1195.txt")

# turn df into zoo
library(zoo)
ru.1195.zoo <- zoo(ru.1195)
tail(ru.1195.zoo)
str(ru.1195.zoo)
save(ru.1195.zoo, file = "ru.1195.zoo.RData")
# ru.1195.zoo["Ru1105"] cannot perform like a data.frame
# rm("ru.1159", "ru.1159.zoo")
ls()
end(ru.1195.zoo)  # end(zoo) won't give the auto-correct end date if there is NAs in the end
tail(ru.1195.zoo)


# find out ru1195.spread
ru11spread <- within(ru.1195, spread1195 <- Ru1109 - Ru1105)
ru11spread <- ru11spread[c(1, 4)]
tail(ru11spread)
str(ru11spread)
save(ru11spread, file = "ru11spread.RData")
dput(ru11spread, file = "ru11spread.txt")
# check files inside directory RockData
list.files()  
ls()
