library(igraph)

g1 <- graph(c(1,2,2,3,2,4,1,4,5,5,3,6))
plot(g1)

g2 <- graph(c(1,2,2,3,2,4,1,4,5,5,3,6), directed = F)
plot(g2)

setwd("C:\\Users\\laura\\Desktop\\소셜네트워크분석")
getwd()
result <- read.csv("stock.csv")

g <- graph.data.frame(result, directed = FALSE)
print(g)

plot(g)
plot.igraph(g)

g1 <- delete.edges(g, E(g)[weight < 0.6])
plot.igraph(g1, layout = layout.auto, vertex.size = 2, vertex.label = NA, edge.arrow = NA, edge.width = 1)

plot.igraph(g1, layout = layout.auto, vertex.size = 4, vertex.label = NA, edge.arrow = NA, edge.width = 1)

plot.igraph(g1, layout = layout.auto, vertex.size = 4, edge.arrow = NA, edge.width = 1)

g1 <- delete.edges(g, E(g)[abs(weight) < 0.6])
Isolated = which(degree(g1) == 0)
g2 = delete.vertices(g1, Isolated)
plot.igraph(g2, layout = layout.auto, vertex.size = 4, edge.arrow = NA, edge.width = 1, edge.curved = TRUE, vertex.label.dist = 2)

plot.igraph(g2, layout = layout.auto, vertex.size = 4, edge.arrow = NA, edge.width = 1, edge.curved = TRUE, vertex.label.dist = 2)

tkplot(g2, vertex.size = 0, edge.arrow = NA, edge.width = 1, edge.curved = TRUE)

junior <- c('유지영 대표', '일지매 부장', '김유신 과장', '이순신 부장', '유관순 과장', '신사임당 대리', '강감찬 부장', '광개토 과장', '정몽주 대리')

senior <- c('유지영 대표', '유지영 대표', '일지매 부장', '김유신 과장', '김유신 과장', '이순신 부장', '유관순 과장', '강감찬 부장', '광개토 과장')

emp <- data.frame(이름 = junior, 상사이름 = senior)
emp

g <- graph.data.frame(emp, directed = T)
plot(g)

plot(g, layout = layout.fruchterman.reingold, vertex.size = 8, egde.arrow.size = 0.5) #vertex.size=8 : 노드의 크기 8 / edge.arrow.size=0.5 : 화살표 크기 줄이기

g <- graph.data.frame(emp, directed = F)
plot(g, layout = layout.fruchterman.reingold, vertex.size = 8, egde.arrow.size = 0.5)