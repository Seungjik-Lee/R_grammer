library(readxl)
library(xlsx)

install.packages('readxl')
install.packages('xlsx')

excelData <- read_excel('resource/data.xlsx')
View(excelData)

studentx <- read.xlsx(file.choose(), sheetIndex = 1, encoding = 'UTF-8')
View(studentx)

#¿¬½À¹®Á¦
# 1/
library(stringr)
suip <- c("2021-04-29 ¼öÀÔ3000¿ø", "2021-04-30 ¼öÀÔ5000¿ø", "2021-05-01 ¼öÀÔ7000¿ø")
price <- str_extract_all(suip, '[0-9]{4}[°¡-ÆR]{1}')
price

# 2. 1¹ø¿¡¼­ '-'¸¦ '/'·Î º¯°æ --> str
str_replace_all(suip, '-', '/')

# 3. ÀÓÀÇÀÇ ±¹¾î, ¿µ¾î, ¼öÇĞ Á¡¼ö¸¦ °¡Áö´Â º¤ÅÍ 3°³ »ı¼º 
#  ex) kor <- c(90, 85, 90)
kor <- c(90, 85, 90)
eng <- c(95, 90, 95)
math <- c(100, 90, 50)

# 4. 3¹ø º¤ÅÍ¸¦ °¡Áö´Â data frame »ı¼º
# 5. ±¹, ¿µ, ¼ö data frame¿¡¼­ ÃÖ´ë°ª ±¸ÇÏ±â
#  --> apply(object, 1, max) : °¡·Î¹æÇâ
#  --> apply(object, 2, max) : ¼¼·Î¹æÇâ
jumsu <- data.frame(kor=kor, eng=eng, math=math)
jumsu
apply(jumsu, 1, max)
apply(jumsu, 2, max)

