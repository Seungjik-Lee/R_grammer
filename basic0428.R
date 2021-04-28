# Ctrl + Enter : 1라인 또는 선택 영역 실행
# Ctrl + Alt + R = 전체 실행
# Ctrl + Alt + B = 처음에서 현재 행까지 실행
# Ctrl + Alt + E = 현재 행에서 마지막까지 실행
# 주석 처리 : Ctrl + Shift + C

#변수 정의
n = 100
n <- 90
n <<- 80

#출력용 함수
print(n)
sprintf("점수 : %d", n)
cat("점수 : ", n)

x <- 10
y <- 20
z <- x * y
cat('%d * %d = %d \n', x, y, z)

x <- 3.5
x
print(x)
sprintf('x : %f', x)

y <- 'string'
print(y)
y <- "문자열"
y

z <- FALSE #(FALSE, F, TRUE, T)
z
z <- TRUE
z

10 + 3
10 - 3
10 * 3
10 / 3
10 %/% 3 #정수값
10 %% 3 #나머지
10 ^ 3 #거듭제곱

#data 입력
print('숫자를 입력하세요.')
num <- scan()
num

print('문자열을 입력하세요.')
str <- scan(what='')
str

df <- data.frame() #Data Frame
df <- edit(df)
df

x <- 8
if (x >0 && x < 10) {
  print('1~10사이 숫자입니다.')
} else {
  print('1~10사이 숫자가 아닙니다.')
}

if (x == 1 || x == 10) {
  print('1이거나 10입니다.')
} else if (x != 8) {
  print('8이 아닙니다.')
} else {
  sprintf('정보는 %d 입니다.', x)
}

num <- 30L
if (is.integer(num)) {
  print('x는 숫자')
} else {
  print('x는 문자열')
}

#vector
data <- c('도우너', '고길동', '고희동', '둘리')
if ('둘리' %in% data) {
  print('둘리가 존재합니다.')
} else {
  print('둘리가 없습니다.')
}

i <- 0
while (i<10) {
  i <- i + 1
  print(i)
}

sum <- 0
for ( i in c(1, 4, 7)) {
  print(sum <- sum +i)
}

sum <- 0
for(i in 1:10){
  if (i %% 2 == 0) {
   next
  }

  if (i == 7) {
   break
  }
  sum <- sum + i
}
print(sum)

index <- seq(1, 10, by=2)
for (i in index) {
  print(i)
}

func1 <- function(start, end) {
  sum <- 0
  for (i in start:end) {
    sum <- sum +i
  }
  return(sum)
}
sprintf('합계 : %d', func1(1,10))

func2 <- function(num1, num2, op) {
  if (op == '+') {
    return(num1 + num2)
  } else {
    return(num1 - num2)
  }
}

func2_1 <- function(...) {
  res <- func2(...)
  return(res)
}
func2_1(10, 5, '+')
func2_1(20, 10, '-')

func_var <- function(...) {
  var <- c(...)
  for (i in var) {
    cat(i, '\t')
  }
}
func_var(1, 2)
func_var(1, 2, 3)
func_var(1, 2, 3, 4, 100)

x <- 3
func1 <- function() {
  x <- 5
  print(x)
}
func1()
print(x)

func2 <- function() {
  x <<- 100
  print(x)
}
func2()
print(x)

add_x <- function(x) {
  function(y) {
    return (x + y)
  }
}

addx <- add_x(3)
addx(2)