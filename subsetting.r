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


##
gdp = as.data.frame(read.csv("D:\\Users\\user\\Downloads\\getdata%2Fdata%2FGDP.csv", stringsAsFactors  =FALSE))
gdp=gdp[5:194,1:5]; gdp = gdp[, c(1,2,4,5)]
country = as.data.frame(read.csv( "D:\\Users\\user\\Downloads\\getdata%2Fdata%2FEDSTATS_Country.csv", stringsAsFactors =FALSE))
country$gdp = 1

dim(country)

which(country$CountryCode=="USA")
which(gdp$X=="USA")
#Hmm
number=""
for(i in 1:dim(country)[1]){
  indexes = which(gdp$X==country$CountryCode[i])
  if(length(gdp[indexes,2])==0 ){
    country$gdp[i] = NA
  }
  else{
    country$gdp[i] = gdp[indexes,2]
  }
}
sum(is.na(country$gdp))+1

sorted <- as.numeric(sort(country$gdp, decreasing=TRUE, na.last=TRUE))
which(country$gdp==sort(country$gdp, decreasing=TRUE, na.last=TRUE)[13])
country$Long.Name[144]

number=""
numlist= as.numeric(unique(na.omit(as.numeric(unlist(strsplit(ww, "[^0-9]+"))))))
for(i in 1:length(numlist)){
  number = paste(c(number,numlist[i]), collapse="")
}


#

index1 = which(country$Income.Group=="High income: OECD")
index2 = which(country$Income.Group=="High income: nonOECD")

mean(as.numeric(country[index1,]$gdp))
mean(as.numeric(country[index2,]$gdp),na.rm=TRUE)

index3 = which(country$Income.Group=="Lower middle income")
sorted2 = sort(as.numeric(country[index3,]$gdp))
sum(sorted2<=38)
