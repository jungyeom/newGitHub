library(data.table)
library(xlsx)
library(XML)
library(httr)
library(jsonlite)

setwd("C:/Users/jungyeom/Desktop/Summer")
data <- read.csv("./getdata-data-ss06hid.csv")

head(data)

DF <- subset(data, VAL >= 24)

nrow(DF)
nrow(data)

data2 <- read.xlsx("./summer2.xlsx", sheetIndex=1, header=TRUE)

rows = 18:23
columns = 7:15

dat <- data2[rows, columns]
head(dat)

colnames(dat) <- c('Zip', 'CuCurrent', 'PaCurrent', 'PoCurrent', 'Contact', 'Ext', 'Fax', 'email', 'Status')

colnames(dat)
dat$Zip
dat$Ext
length(dat$Zip)
length(dat$Ext)

dat$Zip[1]

fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlParse(fileUrl)


DT <- read.csv("./summer3.csv")

system.time(a <- sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(a <- rowMeans(DT)[DT$SEX==1] && rowMeans(DT)[DT$SEX==2])
system.time(a <- DT[,mean(pwgtp15),by=SEX])
system.time(a <- tapply(DT$pwgtp15,DT$SEX,mean))
system.time(a <- mean(DT$pwgtp15,by=DT$SEX))
system.time(a <- mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))


google = handle("http://google.com")
pg1 = GET(handle=google,path="/")
pg2 = GET(handle=google,path="search")
pg1
pg2


#Quiz 2
# Problem 1


# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
#    Insert your values below - if secret is omitted, it will look it up in
#    the GITHUB_CONSUMER_SECRET environmental variable.
#
#    Use http://localhost:1410 as the callback url
myapp <- oauth_app("github", "jtleek", secret = NULL)

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
req <- GET("https://api.github.com/rate_limit", config(token = github_token))
stop_for_status(req)
content(req)

help("oauth_app")

data = fromJSON("https://api.github.com/users/jtleek/repos")
data$created_at
data$name


help("unique")

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
htmlCode
nchar(htmlCode[100])

#Question 5
data5 <- read.fwf(
  file=url("http://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),
  skip=4,
  widths=c(12, 7,4, 9,4, 9,4, 9,4))
head(data5)


