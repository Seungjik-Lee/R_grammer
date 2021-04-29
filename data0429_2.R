library(readxl)
library(xlsx)

install.packages('readxl')
install.packages('xlsx')

excelData <- read_excel('resource/data.xlsx')
View(excelData)

studentx <- read.xlsx(file.choose(), sheetIndex = 1, encoding = 'UTF-8')
View(studentx)