library(KoNLP)
library(wordcloud2)
library(httr)
library(XML)

useNIADic()

url <- "http://news.daum.net"
web <- GET(url)
tail(web)

html <- htmlTreeParse(web, useInternalNodes = T, trim = T, encoding = "utf-8")
rootNode <- xmlRoot(html)
rootNode

news <- xpathApply(rootNode, "//a[@class='link.txt']", xmlValue)
news

newsPre <- gsub("[\r\n\t]", " ", news)
#구두점 제거
newsPre <- gsub("[[:punct:]]", " ", newsPre)
#control 문자
newsPre <- gsub("[[:cntrl:]]", " ", newsPre)
#알파벳 소문자
newsPre <- gsub("[a-z]", " ", newsPre)
#알파벳 대문자
newsPre <- gsub("[A-Z]", " ", newsPre)
newsPre

newsData <- newsPre[1:46]
newsData

write.csv(newsData, "resource/daum0527_news.csv", quote = F)
newsData2 <- read.csv("resource/daum0527_news.csv", header = T, stringsAsFactors = F)
names(newsData2) <- c("no", "title")
str(newsData2)

newsTitle <- newsData2$title

exNouns <- function(x) {paste(extractNoun(x), collapse = "")}
newsNouns <- sapply(newsTitle, exNouns)
str(newsNouns)
                    
newsCorpus <- Corpus(VectorSource(newsNouns))
inspect(newsCorpus[1:5])
tdm <- TermDocumentMatrix(newsCorpus, control = list(wordLengths = c(4,16)))
tdm

#matrix -> dataframe
tdmDF <- as.data.frame(as.matrix(tdm))
wordResult <- sort(rowSums(tdmDF), decreasing = T)
head(wordResult)













