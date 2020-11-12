setwd("D://myR1/traffic_air")
install.packages('jsonlite')
library(jsonlite)
file <- "https://data.epa.gov.tw/api/v1/aqx_p_447?limit=100000&api_key=9be7b239-557b-4c10-9775-78cadfc555e9&format=json"
download.file(file,"airNTP.json")
jdata <- fromJSON("airNTP.json")
str(jdata)
jdata$records$County
x=table(jdata$records$County)
y=sort(x,decreasing = TRUE)
z=as.data.frame(y)
summary(z$Fr)
boxplot(z$Freq)

install.packages('data.table')
library(data.table)