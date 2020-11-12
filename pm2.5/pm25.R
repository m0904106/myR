setwd("D://myR1/pm2.5")
install.packages('jsonlite')
library(jsonlite)
file <- "https://data.epa.gov.tw/api/v1/aqx_p_02?limit=100000&api_key=9be7b239-557b-4c10-9775-78cadfc555e9&format=json"
download.file(file,"pm25NTP.json")
jdata <- fromJSON("pm25NTP.json")
str(jdata)
jdata$records$county
jdata$records$PM25
x=table(jdata$records$county)
y=sort(jdata$records$PM25,decreasing = TRUE)
z=as.numeric(y)
summary(z)
boxplot(z)

install.packages('data.table')
library(data.table)