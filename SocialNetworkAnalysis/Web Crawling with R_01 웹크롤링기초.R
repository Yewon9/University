library(httr)

res <- GET(url = 'https://section.blog.naver.com/BlogHome.nhn?directoryNo=0&currentPage=1&groupId=0')
res <- GET(url = 'https://section.blog.naver.com/BlogHome.nhn', query = list(directoryNo = 0, currentParge = 1, groupId = 0))
print(x = res)
status_code(x = res)
content(x = res, as = 'text', type = 'text/html', encoding = 'EUC-KR')

res <- GET(url = 'https://www.naver.com')
print(x = res)
status_code(x = res)
content(x = res, as = 'text', encoding = 'UTF-8')
