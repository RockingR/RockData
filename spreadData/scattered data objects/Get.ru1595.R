
#eX.1tract data of 2015
ru.1595 <- ru.eX.1cel[ , 33:35] 
head(ru.1595)
# str(ru.1595)

# check Date class or chara class
with(ru.1595, class(X.1)) 

# turn Chara into Date class, and create a new Date class variable
ru.1595 <- within(ru.1595,  Date15 <- as.Date(X.1, format = "%Y/%m/%d"))
str(ru.1595)

# rebuild data ru.1595 and get rid of NAs
colnames(ru.1595)
ru.1595 <- ru.1595[c("Date15", "Ru1505", "Ru1509")]
head(ru.1595)
tail(ru.1595)
View(ru.1595) # see around all the data

# to get rid of rows with NAs
ru.1595 <- na.omit(ru.1595)
save(ru.1595, file = "ru.1595.RData")
dput(ru.1595, file = "ru.1595.tX.1t")

# turn df into zoo
library(zoo)
ru.1595.zoo <- zoo(ru.1595)
tail(ru.1595.zoo)
str(ru.1595.zoo)
save(ru.1595.zoo, file = "ru.1595.zoo.RData")
# ru.1595.zoo["Ru1505"] cannot perform like a data.frame
# rm("ru.1559", "ru.1559.zoo")
ls()
end(ru.1595.zoo)  # end(zoo) won't give the auto-correct end date if there is NAs in the end
tail(ru.1595.zoo)


# find out ru1595.spread
ru15spread <- within(ru.1595, spread1595 <- Ru1509 - Ru1505)
ru15spread <- ru15spread[c(1, 4)]
tail(ru15spread)
str(ru15spread)
save(ru15spread, file = "ru15spread.RData")
dput(ru15spread, file = "ru15spread.tX.1t")
# check files inside directory RockData
list.files()  
ls()
