setwd("D:/myR/myR_2")
rm(list=ls())

fn <- c('in1.txt','in2.txt')
cat("",file = "out.txt",append=F)

for (file in fn) {
  print(file)
  x  <-  read.csv(
    file,
    header = F,
    sep = ",",
    skip = 1,
    col.names = c("data"),
    stringsAsFactors = F,
    fileEncoding = "UTF-8"
  )
  out  <-  vector()
  for (s in x[, 1]) {
    s1  <-  substring(s, 1:nchar(s), 1:nchar(s))
    #print(s1)
    score  <-  rep(0, (length(s1)+1)/2)
    
    o = 0
    j = 1
    for (i in 1:length(s1)) {
      if (s1[i] == '1') {
        o = 1
        score[j] = o
        j = j + 1
        next
      }
      if (s1[i] == '2') {
        o = 2
        score[j] = o
        j = j + 1
        next
      }
      if (s1[i] == '3') {
        o = 3
        score[j] = o
        j = j + 1
        next
      }
      if (s1[i] == '4') {
        o = 4
        score[j] = o
        j = j + 1
        next
      }
      if (s1[i] == '5') {
        o = 5
        score[j] = o
       j = j + 1
       next
      }
      if (s1[i] == '6') {
        o = 6
        score[j] = o
        j = j + 1
        next
      }
      if (s1[i] == '7') {
        o = 7
        score[j] = o
        j = j + 1
        next
      }
      if (s1[i] == '8') {
        o = 8
        score[j] = o
        j = j + 1
        next
      }
      if (s1[i] == '9') {
        o = 9
        score[j] = o
        j = j + 1
        next
      }
      if (s1[i] == '0') {
        o = 0
        score[j] = o
        j = j + 1
        next
      }
      if (s1[i] == 'X') {
        o = 10 
        score[j] = o
        j = j + 1
        next
      }
      if (s1[i] == '/') {
        o = 10 - score[j-1]
        score[j] = o
        j = j + 1
        next
      }
      if (s1[i] == ' ') {
        next
        #o = o + 0
        #score[i] = o
      }
      else{
        o = 0
      }
      #i = i + 2
      
      #print(score[i])
      #print(s1[i])
    }
    
    score1 <- score
    #print(score1)
    #a = length(s1)-4
    P = 0
    for (i in 1:length(s1)) {
      if (s1[i] == 'X') {
        
        p = score[(i+1)/2] + score[(i+3)/2] + score[(i+5)/2]
        score1[(i+1)/2] = p
        
      }
      if (s1[i] == '/') {
        
        p = score[(i+1)/2] + score[(i+3)/2] 
        score1[(i+1)/2] = p
        
      }
      else{
        p = 0
      }
      #print(score1[i])
      
    } 
    
    
    print(s1)
    print(score)
    print(score1)
    
    out  <-  append(out, sum(score1))
    print(out)
  }
  write.table(
    out,
    file = "out.txt",
    append = T,
    row.name = F,
    col.names = F ,
    fileEncoding = "UTF-8"
  )
  cat("\n", file = "out.txt", append = T)
}
