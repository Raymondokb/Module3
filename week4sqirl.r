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


####################
#SWirl Lesson 1
install_from_swirl("Manipulating Data with dplyr")
install_from_swirl("Grouping and Chaining with dplyr")
install_from_swirl("Tidying Data with tidyr")


mydf <- read.csv(path2csv, stringsAsFactors=FALSE)
dim(mydf)
head(mydf)
library(dplyr)
packageVersion("dplyr")

#create data frame tbl $###tbl_df
cran <- tbl_df(mydf)
rm("mydf")

# select(), filter(), arrange(), mutate(), summarize()
#select() for subset of columns
select(cran, ip_id, package, country) #now only 3 columns are "selected"

select(cran, r_arch:country)
select(cran, country:r_arch)
# same columns selected, but in different order. Behaves like an absolute value

select(cran, -time)
select(cran, -(X:size))

#filter for subset of rows
filter(cran, package=='swirl')

filter(cran, r_version=="3.1.1", country=="US")
?Comparison
filter(cran, country=="IN", r_version <= "3.0.2")
filter(cran, country=="US"|country=="IN")

filter(cran, size>100500, r_os=="linux-gnu")



is.na(c(3, 5, NA, 10))

filter(cran, !is.na(r_version))


#arrange(): order row sof a dataset according to the values of a particular variable
cran2 <- select(cran, size:ip_id)
arrange(cran2, ip_id)
arrange(cran2, desc(ip_id))
arrange(cran2, package, ip_id )
arrange(cran2, country, desc(r_version), ip_id)


cran3 <- select(cran, ip_id, package, size)


#mutate(): create a new variable baseed on the value of one or more variables already in a dataset
mutate(cran3, size_mb = size / 2^20)
mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10)
mutate(cran3, correct_size = size+1000)


#summarize(): collapses dataset to a simgpe row
summarize(cran, avg_bytes = mean(size))


#################################
#Swirl lesson 2
install_from_swirl("Grouping and Chaining with dplyr")


