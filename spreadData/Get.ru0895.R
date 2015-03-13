
#extract data of 2008
ru.0895 <- ru.excel[ , 5:7] 
head(ru.0895)
str(ru.0895)

# check Date class or chara class
with(ru.0895, class(Date.1)) 

# turn Chara into Date class, and create a new Date class variable
ru.0895 <- within(ru.0895,  Date08 <- as.Date(Date.1, format = "%Y/%m/%d"))
str(ru.0895)

# rebuild data ru.0895 and get rid of NAs
colnames(ru.0895)
ru.0895 <- ru.0895[c("Date08", "Ru0805", "Ru0809")]
head(ru.0895)
tail(ru.0895)
View(ru.0895) # see around all the data

# to get rid of rows with NAs
ru.0895 <- na.omit(ru.0895)
save(ru.0895, file = "ru.0895.RData")
dput(ru.0895, file = "ru.0895.txt")

# turn df into zoo
library(zoo)
ru.0895.zoo <- zoo(ru.0895)
tail(ru.0895.zoo)
str(ru.0895.zoo)
save(ru.0895.zoo, file = "ru.0895.zoo.RData")
# rm("ru.0859", "ru.0859.zoo")
ls()
end(ru.0895.zoo)  # end(zoo) won't give the auto-correct end date if there is NAs in the end
tail(ru.0895.zoo)

# find out ru0895.spread
ru08spread <- within(ru.0895, spread0895 <- Ru0809 - Ru0805)
ru08spread <- ru08spread[c(1, 4)]
tail(ru08spread)
str(ru08spread)
save(ru08spread, file = "ru08spread.RData")
dput(ru08spread, file = "ru08spread.txt")
# check files inside directory RockData
list.files()  
ls()