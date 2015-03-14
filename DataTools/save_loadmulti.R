?save
?load
?mapply

## check out
ls()
getwd()
list.files()

##1. try to load a number of RData files together
files <- list("ru.0795.RData", "ru.0895.RData", "ru.0995.RData", "ru.1095.RData", "ru.1195.RData", "ru.1295.RData", "ru.1395.RData", "ru.1495.RData", "ru.1595.RData", "ru.excel.RData", "ru07-15merge.RData", "ru07spread.RData", "ru08spread.RData", "ru09spread.RData", "ru10spread.RData", "ru11spread.RData", "ru12spread.RData", "ru13spread.RData", "ru14spread.RData", "ru15spread.RData" )

# tried apply family first, not working, but for loop works
for (i in files) {
  load(i)
}

##2. try to save mutli variable into a single Rdata file
files <- c(ru.0795, ru.0895, ru.0995, ru.1095, ru.1195, ru.1295, ru.1395, ru.1495, ru.1595, ru.excel, ru.merge, ru07spread, ru08spread, ru09spread, ru10spread, ru11spread, ru12spread, ru13spread, ru14spread, ru15spread)



save(ru.0795, ru.0895, ru.0995, ru.1095, ru.1195, ru.1295, ru.1395, ru.1495, ru.1595, ru.excel, ru.merge, ru07spread, ru08spread, ru09spread, ru10spread, ru11spread, ru12spread, ru13spread, ru14spread, ru15spread, file = "Ru07-15Spread.RData")
ls()
rm(list = ls())
load("Ru07-15Spread.RData")
ls()
head(ru.merge)
str(ru.merge)
