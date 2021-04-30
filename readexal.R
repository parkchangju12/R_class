ID <- c(1,2,3,4,5)
SEX <- c("F","M","F","M","F")
DATA <- data.frame(ID = ID, SEX = SEX)
View(DATA)

install.packages("readxl")
library(readxl)

excel_data_ex <- read_excel("C:/Rstudy/data_ex.xls")
View(excel_data_ex)

ex_data <- read.table("C:/Rstudy/data_ex.txt")
View(ex_data)

ex_data1 <- read.table("C:/Rstudy/data_ex.txt", header = TRUE)
View(ex_data1)

ex_data2 <- read.table("C:/Rstudy/data_ex.txt", header = TRUE, skip = 2)
View(ex_data2)

ex_data3 <- read.table("C:/Rstudy/data_ex.txt", header = TRUE, nrows = 7)
View(ex_data3)

ex1_data <- read.table("C:/Rstudy/data_ex1.txt", header = TRUE, sep = ",")
View(ex1_data)

varname <- c("ID", "SEX", "AGE", "AREA")
ex2_data <- read.table("C:/Rstudy/data_ex2.txt", sep = ",", col.names = varname)
View(ex2_data)

data_ex <- data.frame(ID = ID, SEX=SEX)

save(data_ex, file = "data_ex.rda")

load("C:/Rstudy/data_ex.rda")
View(data_ex)

write.csv(data_ex, file = "C:/Rstudy/data_ex.csv")

write.table(data_ex, file = "C:/Rstudy/data_ex.txt")

load("C:/Rstudy/data_ex.csv")
