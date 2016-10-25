d1 = date()
d2 = Sys.time()
str(d2)

format(d2, "%d %b %a")
#%a weekday
#%d day number
#%A unabbrievated weekday
#%m month 00-12
#%b abbrievated month (in number)
#%B unabbrievated month (in words)
#%y 2 digit year
#%Y 4 digit year

x = c("1jan1960", "2jan1960", "31mar1960", "30jul1960"); z = as.Date(x, "%d%b%Y")
z[2]-z[1]
z[4]-z[3]
as.numeric(z[1]-z[2])


weekdays(d2)
months(d2)
julian(d2)
#attr(,"origin")

library(lubridate)
ymd("20140108")
mdy("08/04/2013")
dmy("03-04-2013")

ymd_hms("2011-08-03 10:15:03")
ymd_hms("2011-08-03 10:15:03", tz="Pacific/Auckland")
?Sys.timezone

x = dmy(c("1jan2013", "2jan1960", "31mar1960", "30jul1960"))
wday(x[1])
wday(x[1], label=TRUE)

# Gettin free data resources
#www.data.go.jp
#gapminder: development, human health
#www.asdfree.com

#http://www.infochimps.com/
#www.kaggle.com***** offers data science competitions
#CMU statlib


#R PACKAGES
### twitter, twitteR,
# figshare, rfigshare
# PLoS, rplos
# rOpenSci
# Facebook, RFacebook
# "Google maps, RGoogleMaps


##### Quiz time
loaddata <- read.csv("D:\\Users\\user\\Downloads\\getdata%2Fdata%2Fss06hidquiz4.csv", stringsAsFactors = FALSE, header=TRUE)
store <- strsplit(colnames(loaddata), "wgtp")
store[123]

loaddata2 <- read.csv("D:\\Users\\user\\Downloads\\getdata%2Fdata%2FGDPquiz4_2.csv", stringsAsFactors = FALSE, header = TRUE)

loaddata2$GDP_num <- as.numeric(gsub(",", "", loaddata2$US.dollars.))
mean(loaddata2$GDP_num)

#loaddata2$Economy: country names
grep("^United", loaddata2$Economy) #woah magic


loaddata3 <- read.csv("D:\\Users\\user\\Downloads\\getdata%2Fdata%2FGDPquiz4_3.csv", stringsAsFactors = FALSE, header = TRUE)
loaddata3a <- read.csv("D:\\Users\\user\\Downloads\\getdata%2Fdata%2FEDSTATS_Countryquiz4_3.csv", stringsAsFactors=FALSE, header=TRUE)

grep("[Jj]une", loaddata3a$Special.Notes)
length(grep("[Jj]une", loaddata3a$Special.Notes))

#im in love with grep. Its the shortcut version of regex


library(quantmod)
amzn = getSymbols("AMZN", auto.assign=FALSE)
sampleTimes = index(amzn)

length(grep("2012",sampleTimes))

sampleTimes2 <- amzn[grep("2012",sampleTimes),]
sampleTimes2 <- index(sampleTimes2)
length(grep("Monday",weekdays(sampleTimes2))) #there should be a more efficient way than this 2-tier step.
