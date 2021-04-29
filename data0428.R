ex_vector <- c(1,2,3,4,5,6)
ex_vector
print(ex_vector)
ex_vector[c(1, 5)]
ex_vector[1:3]

ex_vector <- c('홍길동', '김길동', '박길동')
ex_vector[c(1, 5)]
ex_vector[1:2]

ex_vector <- c(1:6)
matrix(ex_vector, nrow = 2, ncol = 3)
matrix(ex_vector, nrow = 3, ncol = 3)
matrix(ex_vector, nrow = 3, ncol = 2, byrow = T)

arr <- c(1:12)
array(arr, dim = c(2, 2, 3))
array(arr, dim = c(2, 2, 3), dimnames = list(c('1행', '2행'), c('1열', '2열'), c('1페이지', '2페이지', '3페이지')))

#[연습문제]
# 1. 'R'문자가 5회 반복 처리되는 벡터 (rep() 함수 사용)
vec1 <- rep('R', 5)
vec1
# 2. 1~10까지 3간격으로 연속되는 벡터 (seq() 함수 사용)
vec2 <- seq(1, 10, by = 3)
vec2
# 3. 1~10까지 3간격으로 연속된 정수가 3회 반복 (rep() 함수 사용)
vec3 <- rep(vec2, each = 3)
vec3
# 4. 2,3번이 모두 포함되는 벡터
vec4 <- c(vec2, vec3)
vec4
# 5. 4번에서 홀수 번째 값들만 저장하는 벡터
vec5 <- vec4[seq(1, 16, by = 2)]
vec5