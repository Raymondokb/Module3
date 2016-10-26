library(swirl)
library(lubridate)
install_from_swirl("Getting and Cleaning Data")
this_moment <- update(this_moment, hours = hour(now()), minutes = minute(now()), seconds = second(now()))

nyc <- now("America/New_York")
#http://en.wikipedia.org/wiki/List_of_tz_database_time_zones

depart <- nyc + days(2)
depart <- update(depart, hours = 17, minutes = 34)
arrive <- depart + hours(15) + minutes(50)

?with_tz
arrive <- with_tz(arrive,"Asia/Hong_Kong")
last_time <- mdy("June 17, 2008", tz="Singapore")

how_long <- interval(last_time, arrive)
as.period(how_long)
