getwd()
readLines("a.txt")
x <- readLines("a.txt")
x
x[1]
x[2]
x[3]

paste(x,collapse=" ")

text <- readLines("a.txt")

text

text2 <- gsub(pattern="\\W",replacement = " ",text)

text2 <- gsub(pattern="\\d",replacement = " ",text2)

tolower(text2)

install.packages('tm')
library(tm)
stopwords()
text2 <- tolower(text2)
text2 <- removeWords(text2,stopwords())
text2 <- gsub(pattern = "\\b[A-z]\\b{1}",replacement = " ",text2)
stripWhitespace(text2)

a <- c("Hola","world","name","is","Tommy.")
a
paste(a,collapse = " ")






str(readLines("a.txt"))
a <- 10
str(a)
b <- 1:10
str(b)

