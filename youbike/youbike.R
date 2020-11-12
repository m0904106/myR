setwd("D://myR1/youbike")
install.packages('jsonlite')
library(jsonlite)
file <- "https://quality.data.gov.tw/dq_download_json.php?nid=123026&md5_url=4d8de527a0bcd8a7b1aeae91120f021d"
download.file(file,"ubikeNTP.json")
jdata <- fromJSON("ubikeNTP.json")
str(jdata)
jdata$sarea
x=table(jdata$sarea)
sort(x)
y=sort(x,decreasing = TRUE)
z=as.data.frame(y)
summary(z$Freq)
boxplot(z$Freq)

install.packages('data.table')
library(data.table)
ubike.csv <- 'youbike.csv'
url <- 'https://data.ntpc.gov.tw/api/datasets/71CD1490-A2DF-4198-BEF1-318479775E8A/csv/file'
download.file(url,ubike.csv)
ubike <- fread(ubike.csv,header = T,encoding = 'UTF-8',stringsAsFactors = F,colClasses = list(character=1:14))

install.packages('ggplot2')
install.packages('magrittr')
# 新北市有多少個 youbike 租借站? 各區的 youbike 總停車格數量為？ 最多站位於何區?
sarea = ubike %>% group_by(sarea) %>% summarise(tot=sum(tot)) %>% arrange(tot)
sarea$sarea <- factor(sarea$sarea,levels=sarea$sarea)
ggplot(sarea,aes(x=sarea,y=tot)) + geom_bar(stat = "identity") +
  theme_bw() +
  theme(text = element_text(size=14, family="Noto Sans CJK
TC"),axis.text.x=element_text(size=rel(1.1), angle=0)) +
  scale_x_discrete(name="新北市",guide = guide_axis(n.dodge = 3)) +
  scale_y_continuous(name="總停車格")

file <- "https://tcgbusfs.blob.core.windows.net/blobyoubike/YouBikeTP.json"
download.file(file,"ubikeTP.json")
m <- fromJSON("ubikeTP.json")
n <- rbindlist(m$retVal)