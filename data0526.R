#로지스틱 회귀분석
#종속변수와 독립변수간의 관계를 구체적인 함수로 나타내어 향후 예측 모델에 사용
#종속변수(범주형) - 독립변수(연속형)
#지도학습 분류되며, 특정 결과의 분류 및 예측 가능

#mtcars dataset
#mpg : 갤런당 마일(연비) - 수치형
#cyl : 실린더 갯수 - 수치형
#disp : 배기량 - 수치형
#hp : 마력 - 수치형
#drat : 리어액슬(후휸제어기술) 비율 - 수치형
#vs : 엔진 종류(0 = V - shaped, 1 = straight) - 범주형
#am : 변속기 종류(0 = automatic, 1 = manual) - 범주형
#gear : 전진기어 갯수 - 수치형
#carb : 기화기 갯수 - 수치형
#wt : 무게 - 수치형형

summary(mtcars)

#로지스틱 회귀분석의 종속변수는 이항변수
#이항분포 옵션 사용
#정규분포 : gaussain, 이항분포 : binomial
#포아송분포 : poisson, 역정규분포 : inverse.gaussian
#감마분포 : gamma
#응답분포가 확실하지 않은 경우 : quasi
vsGlm <- glm(vs ~ mpg+am, data=mtcars, family = binomial)

#회귀분석 결과는 오즈(odds)로 해석
#mpg(연비)의 회귀계수가 0.6809, mpg가 한 단위 증가하면 vs = 1일때 오즈가 exp(0.6809) 증가. -> e^0.6809 (1.98배 증가)
#am의 회귀계수가 -3.0073, am의 1단위가 증가하면, vs = 1 일때 오즈가 exp(-3.0073)  감소. -> 0.05배 감소

#선형회귀분석 : Y(-∞ ~ ∞) = aX + b(-∞ ~ ∞)
#로지스틱 회귀분석 : P(0~1) = aX + b(-∞ ~ ∞)
#P의 성공범위(1: 성공 ~ 0: 실패) 와 aX+b의 범위가 다름
#오즈(odds) : (성공할 확률 / 실패할 확률) = (P / 1-P)
#오즈비(odds ratio) : 성공확률이 실패확률에 비해 몇 배 더 높은지를 나타내는 수식
#Log odds ∈ (-∞ ~ ∞)
summary(vsGlm)

vsGlm2 <- glm(vs ~ mpg + am + wt, data = mtcars, family = binomial)
summary(vsGlm2)

#유의하지 않은 독립변수 제거 (후진소거법)
stepVs <- step(vsGlm2, direction = "backward")

#통계검정방법
#위약을 먹은 집단과 치료제를 먹은 집단간의 혈압 차이
#T-test
#비교 그룹이 2개, 표본(샘플)이 독립적이고, 데이터가 정규분포를 만족

#분산분석(ANOVA)
#10대, 20대, 30대, 40대, 50대 간의 혈압 차이
#3개 이상의 다수 집단을 비교할 때 사용.

#연속형 자료 검정: T-test(이항), anova(다항)
#-> 수치화 가능 : 키, 몸무게
#범주형 자료 검정 : 카이제곱(Chisquare)검정, 피셔의 정확검정법
#-> 수치 불가능 : 성별, 혈액형
anova(vsGlm2, test="Chisq")

#사전확률 : 특정 사건이 일어나기전의 확률
#사후확률 : 특정 사건이 이미 발생하였는데 이 사건의 근본 원인이 무엇인지 불확실한 상황
#기준설정을 0.5로 설정
#사후확률이 0.5 초과이면 stright 엔진으로 예측
#사후확률이 0.5 이하이면 V-shaped 엔진으로 예측
rawData <- mtcars
predict_prob <- predict(stepVs, newdata = rawData, type = "response")
#vs 예측값
predictVs <- ifelse(predict_prob > 0.5, 1, 0)
result <- data.frame(actual = rawData$vs, predicted = predictVs, pred_prob = predict_prob)
head(result)

#혼동행렬(confusion matrix)
#특정 분류 모델의 성능을 평가하는 지표.
#실제값과 모델이 예측한 예측값을 한눈에 알아볼 수 있게 배열한 행렬.
library(caret)
#예측값 , 결과값
confusionMatrix(as.factor(rawData$vs) , as.factor(result$predicted))

























