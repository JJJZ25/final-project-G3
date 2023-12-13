# final-project-G3
https://data.gov.tw/dataset/166494
https://vipmbr.cpc.com.tw/openData/electricmotoData

library(readr)
md <- read_csv("9ffaa7c233159f0b2042e7309b00f3c9_export (1).csv")
View(md)
name=md$站名
number=md$郵遞區號
address=md$地址
charger<-data.frame(
  name=md$站名,
  number=md$郵遞區號,
  address=md$地址
)
View(charger)
list1 <-list(
  name=md$站名,
  number=md$郵遞區號,
  address=md$地址
)
list1[[1]][[1]]
