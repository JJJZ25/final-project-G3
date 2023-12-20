# final-project-G3
https://data.gov.tw/dataset/166494
https://vipmbr.cpc.com.tw/openData/electricmotoData

library(readr)
md <- jsonlite::fromJSON("https://vipmbr.cpc.com.tw/openData/electricmotoData")

## 整合表格內每一個項目
name <- md$站名
number <- md$郵遞區號
address <- md$地址
service <- md$服務類型
code <- md$站代號

charger <- data.frame(
  name = md$站名,
  number = md$郵遞區號,
  address = md$地址
)

# 分析充電站類型、各有幾個----

md$服務類型 |>
  table()

# 分析服務時段（是否為24小時服務）----
## old ----
{
  pick <- md$站名 == "金山站"
  md$提供服務時段[pick]
  class(md$提供服務時段)
  table(md$提供服務時段)
  
  md$提供服務時段 |> head()
}
## new ----
md |>
  dplyr::filter(
    提供服務時段 == "00:00-24:00"
  ) -> md24hrs

View(md24hrs)

# 分析充電站類型服務時段（24小時服務站點數量）

table(md24hrs$服務類型)

# 利用電話區域碼分析地區數量（北、中、南）
sort(number, decreasing = T)
phone = data.frame(md$站名, md$電話)
phone[[1, 2]]
x = phone[[1, 2]]
#-----------
call <- substr(md$電話, 2, 4)
table(call)
