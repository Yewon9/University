library(igraph)
setwd("C:\\Users\\laura\\Desktop\\소셜네트워크분석")
stock_code <- read.csv("stock_code.csv", encoding = "UTF-8")
names(stock_code) <- c('group', 'stock')

rownames(stock_code) <- stock_code$stock

color <- factor(stock_code[V(g2)$name, ]$group)
V(g2)$name
stock_code[V(g2)$name, ]
color

plot.igraph(g2, layout = layout.auto, vertex.size = 6, edge.arrow = NA, edge.width = 1, edge.curved=TRUE, vertex.color = color, vertex.label = NA)
plot.igraph(g2, layout = layout.auto, vertex.size = 10, edge.arrow = NA, edge.width = 1, edge.curved = TRUE, vertex.label.size = 8, vertex.color = color)

color <- factor(stock_code[V(g2)$name, ]$group)

V(g2)$type <- stock_code[V(g2)$name, ]$group

library(RColorBrewer)
jColors <- brewer.pal(nlevels(color), name = 'Spectral')
jColors
names(jColors) <- unique(stock_code$group)
plot.igraph(g2, layout = layout.kamada.kawai,
            vertex.size = 10, edge.arrow = NA,
            edge.width = 1, edge.curved = TRUE,
            vertex.label.size = 8, vertex.color = jcolors)
legend(x = -1.5, y = 1.1, names(jColors), pch = 21,
       pt.bg = jColors, pt.cex = 2, cex = .8, bty = "n", ncol = 3)


g <- read.csv("군집분석.csv")
g <- graph.data.frame(g, directed = T)
plot(g)
plot(g, layout = layout.fruchterman.reingold, vertex.size = 2, edge.arrow.size = 0.5, vertex.color = "green", vertex.label = NA)
plot(g, layout = layout.kamada.kawai, vertex.size = 2, edge.arrow.size = 0.5, vertex.label = NA)

gubun1 <- V(g)$name
library(stringr)
gubun <- str_sub(gubun1, start=1, end=1)
print(gubun)
colors <- ifelse(gubun == "S", "red", "black")
size <- ifelse(gubun == "S", 2, 6)
print(size)

plot(g, layout = layout.fruchterman.reingold, vertex.size = sizes, edge.arrow.size = 0.5, vertex.color = colors)