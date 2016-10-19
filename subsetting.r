set.seed(13435)
X <- data.frame("var1" = sample(1:5), "var2"=sample(6:10), "var3" = sample(11:15))
X <- X[sample(1:5),];   X$var2[c(1,3)] = NA
X

X[,1]
X[, 'var1']
X[1:2, 'var2']

#logicals
X[(X$var1 <= 3 & X$var3 > 11),]
X[(X$var1 <= 3 | X$var3 > 15),]

#Missing values
X[which(X$var2 >8),]


#Sorting
sort(X$var1)
sort(X$var1, decreasing=TRUE)
sort(X$var2, na.last = TRUE)

X[order(X$var1),] #rows are ordered by var1 column
X[order(X$var1, X$var3),]


##Now, ordering using plyr package
library(plyr)
arrange(X, var1)
arrange(X, desc(var1)) #descending

#Adding rows and columns
X$var4 <- rnorm(5)
X

Y <- cbind(X, rnorm(5))
Y

###Quiz time
loadit = read.csv("D:\\Users\\user\\Downloads\\getdata%2Fdata%2Fss06hid2.csv")
agricultureLogical = loadit[(loadit$ACR>2 & loadit$AGS>5),]
#Did it manually

library(jpeg)
library(png)
con <- url("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg",
           open='rb')

rawjpeg <- readBin(con, what='raw', n=50000)

close(con)

jpeg1 <- readJPEG(rawjpeg)

plot(1:10, type='n')
rasterImage( as.raster(jpeg1), 3,3,8,8 )

readJPEG(rawjpeg, TRUE)
quantile(readJPEG(rawjpeg, TRUE), probs = c(0, 0.3, 0.8, 1))