library(RSelenium)
library(wdman)
library(rvest)
library(tidyverse)

port <- 4567L
chrome <- wdman::chrome(port = port)

remote <- remoteDriver(port = port, browserName = 'chrome')
remote$open()
remote$navigate(url = 'https://www.naver.com')

login <- remote$findElement(using = 'xpath', value = '//*[@id="account"]/a')
login$clickElement()

id <- remote$findElement(using = 'xpath', value = '//*[@id="id"]')
id$sendKeysToElement(sendKeys = list('본인 아이디'))

pw <- remote$findElement(using = 'xpath', value = '//*[@id="pw"]')
pw$sendKeysToElement(sendKeys = list('본인 비밀번호'))

login <- remote$findElement(using = 'xpath', value = '//*[@id="log.login"]')
login$clickElement()

remote$navigate(url = "https://cafe.naver.com/ArticleList.nhn?search.clubid=10050146$search.menuid=57&search.boardtype=L&search.totalCount=151&search.page=4")

res <- remote$getPageSource() %>% `[[`(1)

body <- res %>% read_html() %>% html_nodes(css = 'div#postContent') %>% html_text(trim = TRUE)

cafeData$body[i] <- body
print(x = cafeData$body[i])

remote$close()
chrome$stop()