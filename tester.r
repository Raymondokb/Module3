library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ"
html <- htmlTreeParse(url, useInternalNode=T)

xpathSApply(html, "//title", xmlValue)

xpathSApply(html, "//td[@class='gsc_a_c']", xmlValue) #using web scraping learned in PIC 97 :D

#Alternative way using HTTR package library
library(httr); html2 = GET(url)
content2 = content(html2, as='text')
parsedHtml = htmlParse(content2, asText=TRUE)
xpathApply(parsedHtml, "//title", xmlValue)


## Accessing websites with passwords
pg2 = GET("http://httpbin.org/basic-auth/user/passwd",
          authenticate("user","passwd"))
pg2 #200 status if successful
names(pg2)

################
###############
library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "56b637a5baffac62cad9",
                   secret = "8e107541ae1791259e9987d544ca568633da2ebf")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)

#####################
#Quiz questions
library(sqldf)
acs <- read.csv("D:\\Users\\user\\Downloads\\getdata%2Fdata%2Fss06pid.csv", header=T)
head(sqldf("select * from acs where AGEP < 50 and pwgtp1")) #not this
head(sqldf("select pwgtp1 from acs where AGEP < 50"))
sqldf("select * from acs") #not this
head(sqldf("select pwgtp1 from acs"))

#
unique(acs$AGEP)
sqldf("select distinct pwgtp1 from acs")
sqldf("select distinct AGEP from acs") #this one
sqldf("select AGEP where unique from acs")
sqldf("select unique * from acs")
length(unique(acs$AGEP))


#################3