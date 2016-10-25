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
