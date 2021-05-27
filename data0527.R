library(KoNLP)
library(wordcloud2)

# useNIADic()
useSejongDic()

wordData <- readLines("resource/애국가(가사).txt")
wordData

wordData2 <- sapply(wordData, extractNoun)
wordData2

addWords <- c("동해물", " 삼천리", "화려강산", "대한사람", "백두산", "닳도록")

#사용자 사전에 사용자 정의 단어 추가
buildDictionary(user_dic=data.frame(addWords,rep("ncn", length(addWords))), replace_usr_dic = T)

wordData3 <- sapply(wordData, extractNoun, USE.NAMES = F)
wordData3

undata <- unlist(wordData3)
#데이터의 빈도 수 확인
wordTable <- table(undata)
View(wordTable)

#2자 이상 단어 추출
undata2 <- Filter(function(x) {nchar(x) >= 2}, undata)
undata2

wordTable2 <- table(undata2)
wordTable2

sort(wordTable2, decreasing = T)
wordcloud2(wordTable2)

wordcloud2(wordTable2, fontFamily = "맑은 고딕", size = 1.0, color = "random-light", backgroundColor = "black", shape = "star")

library(tm)
facebook <- file("resource/facebook_bigdata.txt", encoding = "UTF-8")
facebookData <- readLines(facebook)
facebookData
userDic <- data.frame(term = c("R 프로그래밍", "페이스북", "소셜네트워크"), tag = "ncn")
buildDictionary(ext_dic = "sejong", user_dic = userDic)

#문자형 변환 후 명사를 추출, " " 으로 데이터 연결하여 하나의 문자열로 변환
exNouns <- function(x) {paste(extractNoun(as.character(x)), collapse = " ")}

fbookNouns <- sapply(facebookData, exNouns)
fbookNouns

#말뭉치
myCorpus <- Corpus(VectorSource(fbookNouns))

#removePunctuation : 특수문자 제거
myCorpusPrepro <- tm_map(myCorpusPrepro, removePunctuation)

#removeNumbers : 숫자 제거
myCorpusPrepro <- tm_map(myCorpusPrepro, removeNumbers)

#tolower : 소문자 변경
myCorpusPrepro <- tm_map(myCorpusPrepro, tolower)

#알파벳 제거
myCorpusPrepro <- tm_map(myCorpusPrepro, removeWords, stopwords("english"))
myCorpusPrepro[1:5]

#연관성 단어 추출
inspect(myCorpusPrepro)

#단어집에서 2~8음절 단어 선택
myCorpusPreproTerm <- TermDocumentMatrix(myCorpusPrepro, control = list(wordLengths = c(4,16)))
myCorpusPreproTerm

#matrix -> dataframe
myTermDF <- as.data.frame(as.matrix(myCorpusPreproTerm))

wordResult <- sort(rowSums(myTermDF), decreasing = T)
wordResult

myName <- names(wordResult)
wordDF <- data.frame(word = myName, freq = wordResult)
View(wordDF)
wordcloud2(wordDF, fontFamily = "맑은 고딕", size = 1.0, color = "random-light", backgroundColor = "black", shape = "circle")




























