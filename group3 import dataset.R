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


