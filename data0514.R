library(googleVis)
library(ggplot2)

str(women)
gScatter <- gvisScatterChart(women, option = list(legned='none', lineWidth=2, pointSize=0, title='Women', vAxis="{title:'weight (lbs)'}", hAxis="{title:'height (in)'}", width=300, height=300))
plot(gScatter)

str(openClose)
gCandle <- gvisCandlestickChart(OpenClose, options = list(legend='none'))
plot(gCandle)

gPie <- gvisPieChart(CityPopularity)
plot(gPie)

gauge1 <- gvisGauge(CityPopularity, labelvar = 'City', numvar = 'Popularity', options = list(min=0, max=1000))
plot(gauge1)

gauge2 <- gvisGauge(CityPopularity, options = list(min=0, max=1000, greenFrom=800, greenTo=1000, yellowFrom=500, yellowTo=800, redFrom=0, redto=500, width=400, height=300))
plot(gauge2)

str(Exports)
g1a <- gvisGeoChart(Exports, locationvar = "Country", colorvar = "Profit")
plot(g1a)
#유럽 지역
g2b <- gvisGeoChart(Exports, 'Country','Profit',options = list(region='150'))
plot(g2b)

city <- c('Seoul','Daegu','Busan','Gwangju')
val<- c(12,8,10,6)
kor <- data.frame(city,val)
kor
g3b <- gvisGeoChart(kor,'city','val',options = list(region='KR',
                                                    displayMode = 'region',
                                                    resolution = 'provinces',
                                                    width=600,height= 400))
plot(g3b)

library(datasets)
states <-data.frame(state.name, state.x77)
gStates <- gvisGeoChart(states,'state.name','Illiteracy',
                        option = list(region='us',
                                      displayMode='regions',
                                      resolution='provinces',
                                      width=600,height=400))
plot(gStates)

#지진정보

##eq <- read.csv('http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_week.csv')
eq<-read.csv('http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_week.csv')
str(eq)
eq$loc = paste(eq$latitude,eq$longitude,sep=':')
eq$loc

g3 <- gvisGeoChart(eq, 'loc','depth','mag',
                   options = list(gvis.editor='EQ',
                                  width='1024',height='768',
                                  dsiplayMode='Markes',
                                  colorAxis="{color:['purple','red','orange','gray']}",
                                  backgroundColor='lightblue',chartid = 'EQ'))
plot(g3)
# airquality 에서 특정달의 날짜와 온도의 정보를 추출하여
# 기온이 >= 75 인 정보만 gauge 차트 출력
# 온도 범위 0~100
# yellow : 0~25, green : 25~75, red : 75~100
str(airquality)
gauge1 <- gvisGauge(CityPopularity, labelvar = 'City', numvar = 'Popularity', options = list(min=0, max=1000))
#temp <- airquality$Month,airquality$Day
df <- data.frame(paste(airquality$Month,airquality$Day,sep='/'),airquality$Temp)
df
air <- gvisGauge(df,  options = list(min=0, max=100, redFrom=75, redTo=100, greenFrom=25, greenTo=75, yellowFrom=0, yellowTo=25, width=1000, height=1000))
plot(air)

# 1. data.go.kr 에서 임의의 정보를 추출하여 gvisGeoChart 출력
# 2. 행정구역 시군구별 성별 인구수 csv or excel 데이터 사용
# 3. 주민등록 인구 및 세대현항 csv or excel 데이터 사용가능능