library(httr)
library(rvest)
library(tidyverse)
library(jsonlite)

res <- GET(url = 'https://api.upbit.com/v1/market/all')
print(x = res)

coinList <- res %>% content(as = 'text') %>% fromJSON()
print(x = coinList)
saveRDS(object = coinList, file = 'C:/Users/laura/Desktop/소셜네트워크분석/coinList.RDS')

coinList <- readRDS(file = 'C:/Users/laura/Desktop/소셜네트워크분석/coinList.RDS')
coinNm <- '비트코인'
coinList[coinList$korean_name == coinNm, 'market']

res <- GET(url = 'https://api.upbit.com/v1/ticker', query = list(markets = 'KRW-BTC'))
print(x = res)

coinPrice <- res %>% content(as = 'text') %>% fromJSON()
print(x = coinPrice)

as.POSIXct(x = coinPrice$trade_timestamp / 1e3, origin = '1970-01-01')
coinPrice$prev_closing_price
coinPrice$trade_price
coinPrice$signed_change_price
coinPrice$signed_change_rate

res <- GET(url = 'https://api.upbit.com/v1/candles/minutes/1', query = list(market = 'KRW-BTC'))
print(x = res)
res %>% content(as = 'text') %>% fromJSON() %>% print()

res <- GET(url = 'https://api.upbit.com/v1/candles/weeks', query = list(market = 'KRW-BTC'))
print(x = res)
res %>% content(as = 'text') %>% fromJSON() %>% print()

res <- GET(url = 'https://api.upbit.com/v1/candles/months', query = list(market = 'KRW-BTC'))
print(x = res)
res %>% content(as = 'text') %>% fromJSON() %>% print()

getCurrentPrice <- function(coinCd) {
  library(httr)
  library(rvest)
  library(tidyverse)
  library(jsonlite)
  
  currentTime <- Sys.time() %>% as.character()
  res <- GET(url = 'https://api.upbit.com/v1/ticker', query = list(markets = coinCd))
  currentPrice <- res %>% content(as = 'text') %>% fromJSON() %>% `[[`('trade_price') %>% format(format = 'd', big.mark = ',')
  result <- data.frame(coin = coinCd, time = currentTime, price = currentPrice)
  return(result)
}

result <- getCurrentPrice(coinCd = 'KRW-BTC')
print(x = result)