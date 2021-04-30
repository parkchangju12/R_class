100%/%7
100%%3

x <- 1:3
y <- 3:1

(x > 0) & (y >1)
(x > 0) | (y > 1)


age <- c(10,20,30,40,50)
weight <- c(80,70,50,60,90)
height <- c(170,180,190,200,160)

total <- data.frame(age, weight, height)
total

ID <- c(1, 2, 3, 4, 5, 6)
SEX <- c("F", "M", "F", "M", "M", "F")
AGE <- c(50, 40, 28, 50, 27, 23)
AREA <- c("서울", "경기", "제주", "서울", "서울", "서울")
AMT17 <- c(130000, 450000, 275000, 400000, 845000, 42900)
Y17_CNT <- c(50, 25, 10, 8, 30, 1)
AMT16 <- c(10000, 70000, 5000, 125000, 760000, 300000)
Y16_CNT <- c(40, 30, 5, 3, 28, 6)
exdata <- data.frame(ID, SEX, AGE, AREA, AMT17, Y17_CNT, AMT16, Y16_CNT)
View(FILE)
write.table(FILE, file = "C:/Rstudy/Sample1.txt")
write.csv(FILE, file = "C:/Rstudy/Sample1.csv")

install.packages("dplyr")
library(dplyr)

exdata1 <- rename(FILE, Y17_AMT = AMT18, Y16_AMT = AMT16)
View(FILE)

library(readxl)
mid_exam <- read_excel("C:/Rstudy/mid_exam.xlsx")
mid_exam <- rename(mid_exam, MATH_MID=MATH, ENG_MID=ENG )
View(mid_exam)

final_exam <- read_excel("C:/Rstudy/final_exam.xlsx")
final_exam <- rename(final_exam, MATH_FINAL=MATH, ENG_FINAL=ENG)
View(final_exam)

total_exam <- inner_join(mid_exam, final_exam, by = "ID")
View(total_exam)

total_exam$MATH_AVG<- (total_exam$MATH_MID + total_exam$MATH_FINAL) / 2
total_exam$ENG_AVG <- (total_exam$ENG_MID + total_exam$ENG_FINAL) / 2
View(total_exam)

total_exam$TOTAL_AVG <- (total_exam$MATH_AVG + total_exam$ENG_AVG) / 2
View(total_exam)
total_exam$TOTAL_AVG <- (total_exam$MATH_MID + total_exam$MATH_FINAL + total_exam$ENG_MID + total_exam$ENG_FINAL) / 4
View(total_exam)




total_exam$TOTAL <- ifelse(total_exam$MATH_MID >=80 & total_exam$ENG_MID >=90, "O" , "X")
total_exam %>% filter(MATH_MID >= 80 & ENG_MID >= 90)

exdata
exdata %>% arrange(AGE)
exdata %>% arrange(AGE,desc(AMT17))
exdata %>% arrange(desc(AMT17))


exdata %>% summarise(TOT_Y17_AMT = sum(Y17_CNT))
exdata %>% summarise(TOT_Y17_AMT = mean(Y17_CNT))
exdata %>% summarise(TOT_Y17_AMT = quantile(Y17_CNT))
exdata %>% summarise(TOT_Y17_AMT = max(Y17_CNT))
exdata %>% summarise(TOT_Y17_AMT = min(Y17_CNT))

ID <- c(1:10)
ID <- c(1,2,3,4)
ID <- c(1,2,3,4,5,6)
SEX <- c("F","M","F","M","M","F","F","F","M","F")
SEX <- c("M","M","M","M")
SEX <- c("F","F","F","F","F","F")
AGE <- c(50,40,28,50,27,23,56,47,20,38)
AGE <- c(40,50,27,20)
AGE <- c(50,28,23,56,47,38)
AREA <- c("서울","경기","제주","서울","서울","서울","경기","서울","인천","경기")
AREA <- c("경기","서울","서울","인천")
AREA <- c("서울","제주","서울","경기","서울","경기")
AMT17 <- c("1,300,000","400,000","275,000","400,000","845,000","42,900","150,000","570,000","930,000","520,000")
AMT17 <- c("450,000","400,000","845,000","930,000")
AMT17 <- c("1,300,000","275,000","42,900","150,000","570,000","520,000")
Y17_CNT <- c(50,25,10,8,30,1,2,10,4,17)
Y17_CNT <- c(25,8,30,4)
Y17_CNT <- c(50,10,1,2,10,17)
AMT16 <- c("100,000","700,000","50,000","125,000","760,000","300,000","130,000","400,000","250,000","550,000")
AMT16 <- c("700,000","125,000","760,000","250,000")
AMT16 <- c("100,000","50,000","300,000","130,000","400,000","550,000")
Y16_CNT <- c(40,30,5,3,28,6,2,7,2,16)
Y16_CNT <- c(30,3,28,2)
Y16_CNT <- c(40,5,6,2,7,16)

Sample2 <- data.frame(ID, SEX, AGE, AREA, AMT17, Y17_CNT, AMT16, Y16_CNT)
Sample3 <- data.frame(ID, SEX, AGE, AREA, AMT17, Y17_CNT, AMT16, Y16_CNT)
Sample2
library(writexl)
write_xlsx(Sample2, "C:/Rstudy/Sample2_m_history.xlsx")
write_xlsx(Sample3, "C:/Rstudy/Sample2_F_history.xlsx")

rm(m_hisory)
m_history <- read_excel("C:/Rstudy/Sample2_m_history.xlsx")
f_history <- read_excel("C:/Rstudy/Sample2_F_history.xlsx")

View(m_history)
View(f_history)

exdata_bindjoin <- bind_rows(m_history, f_history)
View(exdata_bindjoin)

exdata_bindjoin %>% filter(AREA == "제주")
Sampel4 <- exdata_bindjoin %>% filter(AREA == "제주")
Sample4_y17_history <- exdata_bindjoin %>% select(IDAMT17)
Sample4_y16_history <- exdata_bindjoin %>% select(AMT16)
write_xlsx(Sample4_y17_history, "C:/Rstudy/Sample4_y17_history.xlsx")
write_xlsx(Sample4_y16_history, "C:/Rstudy/Sample4_y16_history.xlsx")

jeju_y17_history <- read_excel("C:/Rstudy/Sample4_y17_history.xlsx")
jeju_y16_history <- read_excel("C:/Rstudy/Sample4_y16_history.xlsx")
