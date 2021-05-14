library(readxl)
exdata1 <- read_excel('resource/sample1.xlsx')
exdata1

#빈도수 분석
#install.packages('descr')
library(descr)
#freq 빈도    
freq(exdata1$AGE, plot = T)

#Stem and Leaf plot (descr 함수)
# 통계적 자료를 줄기,  잎, 도수로 표현

stem(exdata1$AGE,scale = 2)
exdata1$AGE

#histrogram : 구간별 빈도수
hist(exdata1$AGE)     #x축 범위 0~100
hist(exdata1$AGE, xlim=c(0,100),
     ylim = c(0,10), main = '나이 분포')
#y축 범위 0~10
hist(exdata1$AGE, main='계좌이용 나이분포',
     xlab ='나이 구간',ylab = '나이빈도',xlim = c(1,100),
     col ='green',probability = T)

hist(exdata1$AGE, main='계좌이용 나이분포',
     xlab ='나이 구간',ylab = '나이빈도',xlim = c(1,100),
     col ='green', freq = T, breaks = 5)
#구간 (막대 갯수)


boxplot(exdata1$Y17_CNT,exdata1$Y16_CNT)
# 1번이 17년도 자료 2번이 16년도 자료

#--------------------------------------------------------
# whisker : 상자의 좌우, 상하로 뻗어 다간 선
# 박스 내의 가로선 : 중앙값
# lower whisker : 최소값
# --> 중앙값 - 1.5 X IQR 보다 큰 데이터중 가장 작은값
# upper whisker : 최댓값
# --> 중앙값 - 1.5 X IQR 보다 작은 데이터중 가장 큰값
# IQR (Inter Quartile Range)
# --> Q3(3사분위수) - Q1(1사분위수) = IQR
# 점 : 이상값 (outlier) - 특이점
# -> lower whisker보다 작은 데이터 또는
#    upper whisker보다 큰 데이터
#--------------------------------------------------------


#사분위
quantile(exdata1$Y17_CNT)
quantile(exdata1$Y16_CNT)
exdata1$Y16_CNT

boxplot(exdata1$Y17_CNT,exdata1$Y16_CNT, ylim = c(0,60),main = 'BoxPlot',
        names = c('17년 계좌건수','16년 계좌 건수'), col = c('green','yellow'))

chart_data <- c(305,450,320,460,330,480,380,520)
names(chart_data)<-c('2018 1분기','2019 1분기',
                     '2018 2분기','2019 2분기',
                     '2018 3분기','2019 3분기',
                     '2018 4분기','2019 4분기')

barplot(chart_data,ylim=c(0,600),col=rainbow(7),main='2018년 vs 2019년 매출 현황 비교')

barplot(chart_data,ylim=c(0,600),ylab='매출액(단위: 백만원)',xlab='년도별 분기 현황',col=rainbow(8),main='2018년 vs 2019년 매출현황 비교')

barplot(chart_data,xlim=c(0,600),horiz=T,ylab='매출액(단위: 백만원)',xlab='년도별 분기 현황',col=rainbow(8),space=0,cex.names=1,main='2018년 vs 2019년 매출현황 비교')

barplot(chart_data,xlim=c(0,600),horiz=T,ylab='매출액(단위: 백만원)',xlab='년도별 분기 현황',col=rep(c(1,2),4),space=1,cex.names=0.8,main='2018년 vs 2019년 매출현황 비교')

barplot(chart_data,xlim=c(0,600),horiz=T,ylab='매출액(단위: 백만원)',xlab='년도별 분기 현황',col=rep(c(5,6,7,8),2),space=1,cex.names=0.8,main='2018년 vs 2019년 매출현황 비교')

data('VADeaths')
VADeaths

par(mfrow = c(1,1))
barplot(VADeaths, beside = T,col = rainbow(5),
        main = '버지니아주 하위계층 사망비율')
legend(19, 71,c('50-54','55-59','60-64',
                '65-69','70-74'),
       cex = 0.8, fill =rainbow(5))


barplot(VADeaths, beside = F,col = rainbow(5))
title(main = '버지니아주 하위계층 사망비율',
      font.main =4)
legend(3.8, 200,c('50-54','55-59','60-64',
                  '65-69','70-74'),
       cex = 0.5, fill =rainbow(5))

par(mfrow=c(1,1))
#도트 차트
dotchart(chart_data,color = c('blue','red'),
         lcolor = 'black', pch = 1:2,
         labels = names(chart_data),
         xlab = '매출액',
         main = '분기별 판매현황 : Dot chart',
         cex = 1.2)
#원차트
pie(chart_data,label =names(chart_data),
    col = rainbow(8), cex = 1.2)
title('2018~2019년도 분기별 매출현황')

boxplot(VADeaths, range = 0)
boxplot(VADeaths, range = 0, notch = T)

data("iris")
str(iris)
summary(iris$Sepal.Length)
hist(iris$Sepal.Length, xlab = '꽃받침 길이',
     ylab = '', col = 'yellowgreen',
     main = 'iris 꽃받침 길이 Histogram',
     xlim = c(4,8))
summary(iris$Sepal.Width)
hist(iris$Sepal.Width,xlab='꽃받침 너비',
     col = 'yellow',
     main = 'iris 꽃받침 너비 Histogram',
     xlim = c(2.0,4.5))

par(mfrow=c(1,2))
hist(iris$Sepal.Width,xlab='꽃받침 너비',
     col = 'yellow', ylab = '',
     main = 'iris 꽃받침 너비 빈도수',
     xlim = c(2.0,4.5))

hist(iris$Sepal.Width,xlab='꽃받침 너비',
     col = 'blue',ylab = '',freq = F,
     main = 'iris 꽃받침 너비 확률 밀도',
     xlim = c(2.0,4.5))
#밀도
lines(density(iris$Sepal.Width),col = 'red')

x <- seq(2.0,4.5,0.1)
#히스토그램의 정규분포 곡선 추가
curve(dnorm(x, mean = mean(iris$Sepal.Width),
            sd=sd(iris$Sepal.Width)),
      col = 'orange', add =T)
