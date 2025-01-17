library(readxl)
library(xlsx)

install.packages('readxl')
install.packages('xlsx')

excelData <- read_excel('resource/data.xlsx')
View(excelData)

studentx <- read.xlsx(file.choose(), sheetIndex = 1, encoding = 'UTF-8')
View(studentx)

#연습문제
# 1/
library(stringr)
suip <- c("2021-04-29 수입3000원", "2021-04-30 수입5000원", "2021-05-01 수입7000원")
price <- str_extract_all(suip, '[0-9]{4}[가-힣]{1}')
price

# 2. 1번에서 '-'를 '/'로 변경 --> str
str_replace_all(suip, '-', '/')

# 3. 임의의 국어, 영어, 수학 점수를 가지는 벡터 3개 생성 
#  ex) kor <- c(90, 85, 90)
kor <- c(90, 85, 90)
eng <- c(95, 90, 95)
math <- c(100, 90, 50)

# 4. 3번 벡터를 가지는 data frame 생성
# 5. 국, 영, 수 data frame에서 최대값 구하기
#  --> apply(object, 1, max) : 가로방향
#  --> apply(object, 2, max) : 세로방향
jumsu <- data.frame(kor=kor, eng=eng, math=math)
jumsu
apply(jumsu, 1, max)
apply(jumsu, 2, max)

