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