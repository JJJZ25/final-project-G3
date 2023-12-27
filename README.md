# final-project-G3
https://data.gov.tw/dataset/166494
https://vipmbr.cpc.com.tw/openData/electricmotoData
https://autos.yahoo.com.tw/news/yahoo%E5%A5%87%E6%91%A9%E9%9B%BB%E5%8B%95%E8%BB%8A%E5%A4%A7%E8%AA%BF%E6%9F%A5%EF%BC%88%E4%B8%89%EF%BC%89%E6%B6%88%E8%B2%BB%E8%80%85%E8%B3%BC%E8%B2%B7%E6%84%8F%E9%A1%98%E3%80%81%E6%9C%80%E6%9C%89%E7%9F%A5%E5%90%8D%E5%BA%A6%E7%9A%84%E9%9B%BB%E5%8B%95%E6%A9%9F%E8%BB%8A%E5%93%81%E7%89%8C-133142169.html

library(readr)
md <- jsonlite::fromJSON("https://vipmbr.cpc.com.tw/openData/electricmotoData")

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
## new ----
md |>
  dplyr::filter(
    提供服務時段 == "00:00-24:00"
  ) -> md24hrs

View(md24hrs)

# 分析充電站類型服務時段（24小時服務站點數量）
table(md24hrs$服務類型)

# 利用電話區域碼分析地區數量（北、中、南）----
md$電話 |>
  # 有"("或")"就斷開
  stringr::str_split("[()]") -> split_phone
zip = vector("character", length(split_phone))
for(i in seq_along(zip)){
  zip[[i]] <- split_phone[[i]][[2]]
}
table(zip) |>
  sort(decreasing=T)
