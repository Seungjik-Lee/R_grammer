list1 <- list(c(1, 2, 3), c('홍길동', '이길동'), TRUE, 12.5)
list1

list2 <- list(c('홍길동', '김길동', '박길동'), c(20, 30, 40))
names(list2) <- c('NAME', 'AGE')
list2
print(list2[1])
print(list2$NAME)
print(list2$NAME[1])
print(list2$AGE[3])

member <- list(name = c('홍길동', '고길동'), age = c(500, 50), address = c('한양', '서울'), gender = c('남자', '남자'), home = c('홍대감댁', '검성고길동의집'))
member
member$name
member$name[1]
member$home[2]
member$age[1] <- 100
member$address[1] <- '한성'
member$home[2] <- '강남 기와집'
member

#Data Frame
id <- c(1, 2, 3, 4, 5)
gender <- c('M', 'F', 'M', 'F', 'F')
age <- c(25, 32, 45, 51, 12)
addr <- c('대구광역시 동구 신암1동', '대구광역시 동구 신암2동', '대구광역시 동구 신암3동', '대구광역시 동구 신암4동', '대구광역시 동구 신암5동')
dataValue <- data.frame(id, gender, age, addr)
dataValue
mode(dataValue)
class(dataValue)
View(dataValue)

dataVal <- edit(data.frame())
dataVal

id_r1 <- c('a1', 'a2', 'a3', 'a4')
name_r1 <- c('홍길동', '고길동', '박길동', '이길동')
stu_r1 <- data.frame(id_r1, name_r1)
stu_r1
stu_r2 <- data.frame(id_r2 = c('j1', 'j2', 'j3', 'j4'), name_r2 = c('전우치', '김우치', '이우치', '박우치'))
stu_r2
names(stu_r1) <- c('ID', '이름')
names(stu_r2) <- names(stu_r1)
#행 결합
studRbind <- rbind(stu_r1, stu_r2)
studRbind

stu_c1 <- data.frame(id = c('i1', 'i2', 'i3'), name = c('도우너', '둘리', '마이콜'))
names(stu_c1) <- c('ID', '이름')
stu_c1
stu_c2 <- data.frame(age = c(20, 30, 40), gender = c('M', 'M', 'F'))
names(stu_c2) <- c('나이', '성별')
stu_c2
#열 결합
studCbind <- cbind(stu_c1, stu_c2)
studCbind

stu_j1 <- data.frame(id = c('i1', 'i2', 'i3'), gender = c('M', 'F', 'M'))
names(stu_j1) <- c('ID', '성별')
stu_j1
stu_j2 <- data.frame(id = c('i2', 'i3', 'i4'), gender = c('M', 'F', 'M'))
names(stu_j2) <- c('ID', '성별')
stu_j2
#일치 정보 확인
studJoin <- merge(x = stu_j1, y = stu_j2, by = 'ID')
studJoin

# install.packages('stringr')
library(stringr)

strData <- c('홍길동35이순신45유관순23')
str_extract(strData, '[1-9]{2}')
str_extract_all(strData, '[1-9]{2}')

strData1 <- 'hongkd105leess1002you23감강찬2005'
str_extract_all(strData1, '[a-z]{3}')
str_extract_all(strData1, '[a-z]{3,}')
str_extract_all(strData1, '[a-z]{3,5}')

str_extract_all(strData1, 'hong')
str_extract_all(strData1, '25')
str_extract_all(strData1, '[가-힣]{4}')
str_extract_all(strData1, '[a-z]{3}')
str_extract_all(strData1, '[0-9]{4}')

str_extract_all(strData1, '[^a-z]')
str_extract_all(strData1, '[^a-z]{4}')
str_extract_all(strData1, '[^가-힣]{5}')
str_extract_all(strData1, '[^0-9]{3}')

name <- '홍길동1234,이순신5678,고길동1011'
str_extract_all(name, '\\w{7,}')
str_extract_all(name, '\\d')
str_match_all(name, '\\d')

size <- str_length(name)
size

str_locate(strData1, '강감찬')
strDataSub <- str_sub(strData1, 1, str_length(strData1)-10)
strDataSub

upstr <- str_to_upper(strDataSub); upstr
str_to_lower(upstr)

jumin <- '123456-1234567'
str_extract(jumin,'[0-9]{6}-[1-4][0-9]{6}')

#1974년 미국 자동차 잡지 Data Frame
mtcars
str(mtcars)
head(mtcars)
tail(mtcars)
dim(mtcars)
length(mtcars)
length(mtcars$cyl)
names(mtcars)
class(mtcars)
mode(mtcars)
sapply(mtcars, class)

