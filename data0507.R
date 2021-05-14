###########################################################
#1.ozone 합, 평균값, 표준편차, 분산 구하기
#  -->NA 제거
names(airquality) <- tolower(names(airquality))
str(airquality)
class(airquality)
sum(airquality$ozone, na.rm = T)
#2.모든 NA 제거 후, 각 월별로 측정값들의 평균
# 3. 5월달 평균 온도, 풍속
# 4.ozone 5월달 합, 평균, 분산, 표준편차
# -->NA 제거
# -->각각 R 기본함수와 사용자 정의 함수 사용
# 5.5월 7일 데이터 출력
str(airquality)
airquality[airquality$Month==5 & airquality$day==7,]
# 6. 5/1~5/6까지 오존농도
# 7.기온이 가장 높은 날짜를 기준으로 출력
# 8.기온이 가장 높은 날의 모든 데이터 출력
# 9.6월달에 발새한 가장 강한 바람의 세기 출력