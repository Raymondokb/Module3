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
