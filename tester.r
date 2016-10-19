library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ"
html <- htmlTreeParse(url, useInternalNode=T)

xpathSApply(html, "//title", xmlValue)
