
attributes(iris)
pairs(iris[iris$Species == 'virginica',1:4])
pairs(iris[iris$Species == 'setosa', 1:4])
pairs(~ Sepal.Width +Sepal.Length + Petal.Width + Petal.Length, data=iris,col=iris$Species)

# 산점도
# 난잡하게 흐트러진건 데이터로써의 의미가없다
# 상관분석 두 변수가 서로 어떤관계에 있는지 파악하는 분석 기법

# 공분산
# 각 확률 변수들이 어떻게 퍼져있는지를 나타 내는 것
# x의 편차와 y의 편차를 곱한것의 평균값


# 귀무 가설 : 두 변수는 서로 상관 관계가 없다 (r = 0)
# 대립 가설 : 두 변수는 서로 상관 관계가 있다 (r != 0)

# 상관 계수 - 상관 관계의 정도를 파악
# 피어슨 (Pearson) 상관계수
# - 기본적으로 사용
# - -1 ~ +1 사이의 값을 가짐
# - 절대값이 1에 가까울수록 상관관계는 높아진다

# - +-0.9 이상 : 매우 높은 상관 관계
# - +-0.9 ~ 0.7 : 높은 상관 관계
# - +-0.7 ~ 0.4 : 다소 높은 상관관계
# - +-0.4 ~ 0.2 : 낮은 상관관계
# - +-0.2 미만  : 상관관계 없음

# 상관계수 식
# X바 : 표본집단 X의 평균
# y바 : 표본집단 Y의 평균
# Sx : 표본집단 x의 표준편차
# Sy : 표본집단 y의 표준편차
# n : 표본 집단의 갯수

# 켄달 (Kendall) 상관계수
# 스피어먼 (Spearman) 상관계수
# - 순위, 등급으로 변경해서 사용 ex) 학교 등급, 졸업학위 성적

# 공분산
cov(mtcars$mpg, mtcars$cyl)
plot(mtcars$mpg, mtcars$cyl)

# 상관계수
cor(mtcars$mpg, mtcars$cyl)