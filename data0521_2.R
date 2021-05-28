library(jsonlite)
library(ggplot2)

api <- "http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getMinuDustFrcstDspth"
apiKey <- "OdXDUPZk1H5uGX4y0vqwIi2zUsKo6rJTaf7n87m0lLKmr2fr1D1156FYBO1thOiWeZ5sL3u078PqfRmambn9rQ%3D%3D"

returnType <- "json"
numOfRows <- 100
pageNo <- 1
InformCode <- "PM10"

url <- paste(api, "?serviceKey=", apiKey, "&returnType=", returnType, "&numOfRows=", numOfRows, "&pageNo=",  pageNo, "&InformCode=", InformCode, sep = "")
url

returnType <- "json"
numOfRows <- 100
pageNo <- 1
InformCode <- "PM10"

url <- paste(api,"?serviceKey=",apikey,"&returnType=",returnType,
             "&numOfRows=",numOfRows,"&pageNo=",pageNo,"&InformCode=",InformCode,
             sep="")
url
jsonData <-fromJSON(url)
str(jsonData)

df<-data.frame(jsonData$response$body$items$informCode,
               jsonData$response$body$items$dataTime)

df

ggplot(data=df, aes(x=dataTime, y=informCode)) + 
  geom_bar(stat = "identity", fill="green")

ggplot(data=df, aes(x=dataTime, y=informCode)) + 
  geom_bar(stat = "identity", fill="green") +
  # x축 눈금 라벨 90도 회전
  theme(axis.text.x = element_text(angle=90)) +
  labs(title="대기질 예보통보 조회", x="통보날짜", y="통보코드")

ggplot(data=df, aes(x=dataTime, y=informCode, fill=informCode)) + 
  geom_bar(stat = "identity") +
  # x축 눈금 라벨 90도 회전
  theme(axis.text.x = element_text(angle=90)) +
  labs(title="대기질 예보통보 조회", x="통보날짜", y="통보코드") +
  scale_fill_manual(values = rainbow(7))

ggplot(data=df, aes(x=dataTime, y=informCode, fill=informCode)) + 
  geom_bar(stat = "identity") +
  # x축 눈금 라벨 90도 회전
  theme(axis.text.x = element_text(angle=90)) +
  labs(title="대기질 예보통보 조회", x="통보날짜", y="통보코드") +
  scale_fill_manual(values = rainbow(7)) +
  coord_flip()
