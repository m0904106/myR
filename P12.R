# 108 全國高中技藝競賽 正式術科 p12
setwd("D:/myR/myR_2")
library(stringr)
fn=c('in1.txt','in2.txt')
cat("",file = "out.txt",append=F)

for (file in fn) {
  x = read.csv(
    file,
    header = F,
    sep = ",",
    skip = 1,
    col.names = c("game"),
    stringsAsFactors = F,
    fileEncoding = "UTF-8"
  )
  
  BallCount = str_count(x[, 1], pattern = "[1-9]|X|/")
  y = cbind(x, ball = BallCount)
  print(y)
  
  
  total = rep(0, nrow(y))
  
  for (i in 1:nrow(y)) {
    round = rep(0, 10)
    p = unlist(str_split(y[i, 1], " ", simplify = F))
    score = rep(0, y[i, 2])
    for (j in 1:length(p)) {
      if (p[j] == "X") {
        score[j] = 10
      }
      else{
        if (p[j] == "/") {
          score[j] = 10 - as.integer(p[j - 1])
        } else{
          score[j] = as.integer(p[j])
        }
      }
    }
    round = 1
    ball = 1
    for (j in 1:length(p)) {
      if (round < 10) {
        if (p[j] == "X") {
          score[j] = score[j] + score[j + 1] + score[j + 2]
          round = round + 1
          ball = 1
          next
        }
        if (p[j] == "/") {
          score[j] = score[j] + score[j + 1]
          round = round + 1
          ball = 1
          next
        }
        if (ball >= 2) {
          round = round + 1
          ball = 1
        } else{
          ball = ball + 1
        }
      }
    }
    total[i] = sum(score)
    
  }
  print(total)
  write.table(
    total,
    file = "out.txt",
    append = T,
    row.name = F,
    col.names = F ,
    fileEncoding = "UTF-8"
  )
  cat("\n", file = "out.txt", append = T)
}
