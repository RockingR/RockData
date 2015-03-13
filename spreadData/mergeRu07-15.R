#### build zoo for ru.spread.07-15
list.files()
ls()
load("ru07spread.RData")
rm(i, tempt, tempz)
View(ru08spread)
### make ru07spread longer from 2006-09-16 to 2007-05-17 and use 09-26's value for the date before
# View(ru07spread)
# ru07spread <- rbind(data.frame(Date07 = seq(as.Date("2006-09-16"), as.Date("2006-09-25"), by = 1), spread0795 = 790), ru07spread)
# str(ru07spread)

### make ru07spread into a zoo################################################
View(ru07spread)
ru07spz <- zoo(ru07spread[, 2], ru07spread[, 1])
str(ru07spz)


### now make all ru08-15spread alike into zoos######################################

#1. make the above action into a function
sp_z <- function(x) {
  zoo(x[, 2], x[, 1])
}
tempt <- sp_z(ru07spread)
str(tempt)

#2. make a list to contain all ru07-15spreads 
list.sp <- list(ru07spread, ru08spread, ru09spread, ru10spread, ru11spread, ru12spread, ru13spread, ru14spread, ru15spread)
str(list.sp)

#3. apply sp_z function to all the element of the list.sp
z.list.sp <- lapply(list.sp, sp_z)

#4. give each list element a name
names(z.list.sp) <- c("ru07spz", "ru08spz", "ru09spz", "ru10spz", "ru11spz", "ru12spz", "ru13spz", "ru14spz", "ru15spz" )
str(z.list.sp) # now we have a list of all zoo objects for all the years
z.list.sp[1]


#4.5. merge one z.list.sp element with an empty zoo
dates <- seq(from = as.Date("2006-09-16"), to = as.Date("2007-05-17"), by = 1)
str(dates)
empty <- zoo(, dates)
# View(empty)
# now start to merge
tempt07 <- merge(z.list.sp[["ru07spz"]], empty) # with empty, new zoo inherited their dates
View(tempt07)
# missing data carry forward
tempt07 <- na.locf(tempt.m)
View(tempt07)
#5. now subset those zoo objects to have the same length
tempt07 <- window(tempt07, start = as.Date("2006-09-26"), end = as.Date("2007-05-15"))
View(tempt07)
str(ru07spread)
str(tempt07) # need 02-29

## get 08data ready 
dates <- seq(from = as.Date("2007-09-16"), to = as.Date("2008-05-17"), by = 1)
str(dates)
empty <- zoo(, dates)
# View(empty)
# now start to merge
tempt08 <- merge(z.list.sp[[2]], empty) # with empty, new zoo inherited their dates
str(tempt08)
View(tempt08)
# missing data carry forward
tempt08 <- na.locf(tempt08)
str(tempt08)
tempt08 <- window(tempt08, start = as.Date("2007-09-26"), end = as.Date("2008-05-15"))
View(tempt08)
str(ru08spread)
str(tempt08)


## get 09data ready 
dates <- seq(from = as.Date("2008-09-16"), to = as.Date("2009-05-17"), by = 1)
str(dates)
empty <- zoo(, dates)
# View(empty)
# now start to merge
tempt09 <- merge(z.list.sp[[3]], empty) # with empty, new zoo inherited their dates
str(tempt09)
View(tempt09)
# missing data carry forward
tempt09 <- na.locf(tempt09)
str(tempt09)
tempt09 <- window(tempt09, start = as.Date("2008-09-26"), end = as.Date("2009-05-15"))
View(tempt09)
str(ru09spread)
str(tempt09) # need 02-29


## get 10data ready 
dates <- seq(from = as.Date("2009-09-16"), to = as.Date("2010-05-17"), by = 1)
str(dates)
empty <- zoo(, dates)
# View(empty)
# now start to merge
tempt10 <- merge(z.list.sp[[4]], empty) # with empty, new zoo inherited their dates
str(tempt10)
View(tempt10)
# missing data carry forward
tempt10 <- na.locf(tempt10)
str(tempt10)
tempt10 <- window(tempt10, start = as.Date("2009-09-26"), end = as.Date("2010-05-15"))
View(tempt10)
str(ru10spread)
str(tempt10) # need 02-29

## get 11data ready 
dates <- seq(from = as.Date("2010-09-16"), to = as.Date("2011-05-17"), by = 1)
str(dates)
empty <- zoo(, dates)
# View(empty)
# now start to merge
tempt11 <- merge(z.list.sp[[5]], empty) # with empty, new zoo inherited their dates
str(tempt11)
View(tempt11)
# missing data carry forward
tempt11 <- na.locf(tempt11)
str(tempt11)
tempt11 <- window(tempt11, start = as.Date("2010-09-26"), end = as.Date("2011-05-15"))
View(tempt11)
str(ru11spread)
str(tempt11) # need 02-29

## get 12data ready 
dates <- seq(from = as.Date("2011-09-16"), to = as.Date("2012-05-17"), by = 1)
str(dates)
empty <- zoo(, dates)
# View(empty)
# now start to merge
tempt12 <- merge(z.list.sp[[6]], empty) # with empty, new zoo inherited their dates
str(tempt12)
View(tempt12)
# missing data carry forward
tempt12 <- na.locf(tempt12)
str(tempt12)
tempt12 <- window(tempt12, start = as.Date("2011-09-26"), end = as.Date("2012-05-15"))
View(tempt12)
str(ru12spread)
str(tempt12) 

## get 13data ready 
dates <- seq(from = as.Date("2012-09-16"), to = as.Date("2013-05-17"), by = 1)
str(dates)
empty <- zoo(, dates)
# View(empty)
# now start to merge
tempt13 <- merge(z.list.sp[[7]], empty) # with empty, new zoo inherited their dates
str(tempt13)
View(tempt13)
# missing data carry forward
tempt13 <- na.locf(tempt13)
str(tempt13)
tempt13 <- window(tempt13, start = as.Date("2012-09-26"), end = as.Date("2013-05-15"))
View(tempt13)
str(ru13spread)
str(tempt13) # need 02-29

## get 14data ready 
dates <- seq(from = as.Date("2013-09-16"), to = as.Date("2014-05-17"), by = 1)
str(dates)
empty <- zoo(, dates)
# View(empty)
# now start to merge
tempt14 <- merge(z.list.sp[[8]], empty) # with empty, new zoo inherited their dates
str(tempt14)
View(tempt14)
# missing data carry forward
tempt14 <- na.locf(tempt14)
str(tempt14)
tempt14 <- window(tempt14, start = as.Date("2013-09-26"), end = as.Date("2014-05-15"))
View(tempt14)
str(ru14spread)
str(tempt14) # need 02-29

## get 15data ready 
dates <- seq(from = as.Date("2014-09-16"), to = as.Date("2015-05-17"), by = 1)
str(dates)
empty <- zoo(, dates)
# View(empty)
# now start to merge
tempt15 <- merge(z.list.sp[[9]], empty) # with empty, new zoo inherited their dates
str(tempt15)
View(tempt15)
# missing data carry forward
tempt15 <- na.locf(tempt15)
str(tempt15)
tempt15 <- window(tempt15, start = as.Date("2014-09-26"), end = as.Date("2015-05-15"))
View(tempt15)
str(ru15spread)
str(tempt15) # need 02-29

## tempt08, tempt12 have 02-29, we need to get rid of
tempt08[as.Date("2008-02-29")]
trial <- tempt08
trial.index <- as.character(index(trial))
str(trial.index)
trial.coredata <- coredata(trial)
str(trial.coredata)
trial.df <- data.frame(trial.index, trial.coredata)
str(trial.df)
View(trial.df)
trial.df["2008-02-29",]
trial.na <- na.omit(trial.df)
trial.z <- with(trial.na, zoo(trial.coredata, trial.index))
str(trial.z)
View(trial.z)
tempt08 <- trial.z

tempt12[as.Date("2012-02-29")]
trial <- tempt12
trial.index <- as.character(index(trial))
str(trial.index)
trial.coredata <- coredata(trial)
str(trial.coredata)
trial.df <- data.frame(trial.index, trial.coredata)
str(trial.df)
View(trial.df)
rownames(trial.df) <- trial.df$trial.index
rownames(trial.df)
trial.df["2012-02-29",]
trial.df["2012-02-29",]
trial.df["2012-02-29",] <- NA
trial.na <- na.omit(trial.df)
View(trial.na)
trial.z <- with(trial.na, zoo(trial.coredata, trial.index))
str(trial.z)
View(trial.z)
tempt12 <- trial.z


#### now all data have the same length, we can combine all the coredata into one dataframe, and use 07dates, to form a zoo
str(coredata(tempt12))
tempt.core <- data.frame(coredata(tempt07), coredata(tempt08), coredata(tempt09), coredata(tempt10), coredata(tempt11), coredata(tempt12), coredata(tempt13), coredata(tempt14), coredata(tempt15))
str(tempt.core)
View(tempt.core)
tempt.index <- index(tempt07)
str(tempt.index)
final.z <- zoo(tempt.core, tempt.index)
ru.merge <- final.z
save(ru.merge, file = "ru07-15merge.RData")
getwd()
plot(final.z)


