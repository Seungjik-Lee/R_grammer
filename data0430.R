library(readxl)
library(xlsx)

install.packages('readxl')
install.packages('xlsx')

excelData <- read_excel('resource/data.xlsx')
View(excelData)

studentx <- read.xlsx(file.choose(), sheetIndex = 1, encoding = 'UTF-8')
View(studentx)

textData <- read.table('resource/data.txt')
View(textData)

# header : 데이터에서 1행이 변수명인지 판별
# ex) 1행이 변수명이면 header = TRUE

# skip : 특정 행까지 제외하고 데이터 가져오기
# ex) 3행부터 가져오기 -> skip = 2

# nrows : 특정 행까지 데이터 가져오기
# ex) 7행까지 데이터 가져오기 -> nrows = 7

# sep : 데이터 구분자 지정
# ex) 쉼표로 구분된 데이터 집합 -> ','

textData1 <- read.table('resource/data1.txt', header = TRUE, sep = ',')
View(textData1)

varName <- c('ID', '성별', '나이', '지역')
textVar <- read.table('resource/data2.txt', sep = ',', col.names = varName)
View(textVar)

# .rda(통계용 파일)
id <- c(1, 2, 3, 4, 5)
name <- c('홍길동', '고길동', '박길동', '이길동', '김길동')
rdaData <- data.frame(ID=id, NAME=name)
# rda file 저장
save(rdaData, file = 'resource/data.rda')
load('resource/data.rda')
View(rdaData)

id <- c(1, 2, 3, 4, 5)
name <- c('홍길동', '고길동', '박길동', '이길동', '김길동')
dataCsv <- data.frame(ID=id, NAME=name)
write.csv(dataCsv, file = 'resource/data.csv')

dataTxt <- data.frame(ID=id, NAME=name)
write.csv(dataTxt, file = 'resource/data_sav.txt')

titanic <- read.csv('http://vincentarelbundock.github.io/Rdatasets/csv/COUNT/titanic.csv')
titanic

dim(titanic)
str(titanic)

# 데이터 빈도
table(titanic$age)
table(titanic$sex)
table(titanic$survived)

head(titanic)
tail(titanic)

# 교차 분할표
tab <- table(titanic$survived, titanic$sex)
tab

plot(tab, col = c('green', 'blue'), main = '성별에 따른 생존 여부')
barplot(tab, col = c('green', 'blue'), main = '성별에 따른 생존 여부')

write.table(titanic, 'resource/titanic.txt', row.names = FALSE)
titanicDF <- read.table(file = 'resource/titanic.txt', sep = '', header = T)
View(titanicDF)
write.csv(titanicDF, 'resource/titanic.csv', row.names = F, quote = F)


library(writexl)
write_xlsx(x = titanicDF, path = 'resource/titanic.xlsx', col_names = T)

# 문제(인)
# 1. 동전 앞면과 뒷면에 대한 확률 함수 구현
# 랜덤 생성 : runif() -> runif(5, min = 0, max = 1)
probability <- 1/choose(2,1)
probability
# 2. 동전 20회 던졌을 때 앞, 뒤를 출력
 

coinTest <- function(n) {
  r <- runif(n, min=0, max=1)
  res <- c()
  for(i in 1:n) {
    if(r[i] <= 0.5) {
    res[i] <- 0
    }
    else {
    res[i] <- 1
    }
  }
  return(res)
}

res <- coinTest(1)
rs
hist(res)

monteTest <- function(n) {
  cnt <- 0
  for(i in 1:n) {
    cnt <- cnt + coinTest(1)
  }
  result <- cnt/n
  return(result)
}

monteTest(2)
monteTest(10000)
monteTest(1000000)








