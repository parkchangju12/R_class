library(readxl)
library(dplyr)

dustdata <- read_excel("C:/Rstudy/Rproject/dustdata.xlsx")
View(dustdata)

str(dustdata)

dustdata_anal <- dustdata %>% filter(area %in% c("성북구", "중구"))
View(dustdata_anal)

count(dustdata_anal, yyymmdd) %>% arrange(desc(n))

count(dustdata_anal, area) %>% arrange(desc(n))
