library(readr)
md <- read_csv("9ffaa7c233159f0b2042e7309b00f3c9_export (1).csv")
View(md)
name=md$站名
number=md$郵遞區號
address=md$地址
service=md$服務類型
code=md$站代號
charger<-data.frame(
  name=md$站名,
  number=md$郵遞區號,
  address=md$地址
)
table(charger)
View(charger)
list1 <-list(
  name=md$站名,
  number=md$郵遞區號,
  address=md$地址
)
list1[[1]][[1]]

class(charger)
table(number)

#分析充電站類型、各有幾個----
data.frame(
  service
)
table(service)

#分析服務時段（是否為24小時服務）----
pick<-md$站名=="金山站"
md$提供服務時段[pick]
class(md$提供服務時段)
table(md$提供服務時段)




#分析地區（北、中、南）
sort(number,decreasing = T)


