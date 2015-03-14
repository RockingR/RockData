
#extract data of 2014
ru.1495 <- ru.excel[ , 29:31] 
head(ru.1495)
# str(ru.1495)

# check Date class or chara class
with(ru.1495, class(X)) 

# turn Chara into Date class, and create a new Date class variable
ru.1495 <- within(ru.1495,  Date14 <- as.Date(X, format = "%Y/%m/%d"))
str(ru.1495)

# rebuild data ru.1495 and get rid of NAs
colnames(ru.1495)
ru.1495 <- ru.1495[c("Date14", "Ru1405", "Ru1409")]
head(ru.1495)
tail(ru.1495)
View(ru.1495) # see around all the data

# to get rid of rows with NAs
ru.1495 <- na.omit(ru.1495)
save(ru.1495, file = "ru.1495.RData")
dput(ru.1495, file = "ru.1495.txt")

# turn df into zoo
library(zoo)
ru.1495.zoo <- zoo(ru.1495)
tail(ru.1495.zoo)
str(ru.1495.zoo)
save(ru.1495.zoo, file = "ru.1495.zoo.RData")
# ru.1495.zoo["Ru1405"] cannot perform like a data.frame
# rm("ru.1459", "ru.1459.zoo")
ls()
end(ru.1495.zoo)  # end(zoo) won't give the auto-correct end date if there is NAs in the end
tail(ru.1495.zoo)


# find out ru1495.spread
ru14spread <- within(ru.1495, spread1495 <- Ru1409 - Ru1405)
ru14spread <- ru14spread[c(1, 4)]
tail(ru14spread)
str(ru14spread)
save(ru14spread, file = "ru14spread.RData")
dput(ru14spread, file = "ru14spread.txt")
# check files inside directory RockData
list.files()  
ls()
