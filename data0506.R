library(readxl)
install.packages("readxl")
exdata1 <- read_excel('resource/sample1.xlsx')
View(exdata1)
str(exdata1)
dim(exdata1)
ls(exdata1)

library('dplyr')
install.packages('dplyr')
exdata1 <- rename(exdata1, Y17_AMT=AMT17, Y16_AMT=AMT16)
View(exdata1)

exdata1$AMT_NEW <- exdata1$Y17_AMT + exdata1$Y16_AMT
exdata1$CNT_NEW <- exdata1$Y17_CNT + exdata1$Y16_CNT
View(exdata1)

exdata1$AVG_AMT <- exdata1$AMT_NEW / exdata1$CNT_NEW
View(exdata1)