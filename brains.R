install.packages("igraph") 
library(igraph)
labl<-as.matrix(read.table("C:/Users/giannhs/Documents/brain_label.txt"))
adj_matrix<-as.matrix(read.table("C:/Users/giannhs/Documents/brain_data.txt"))
g<-graph.adjacency(adj_matrix)
isSymmetric.matrix(adj_matrix)
plot(g)
d = degree(g, mode="all")
t<-(d)
t
View(d)
get.shortest.paths(
                      g,"V34","V60")
betweenness(
                      g, 
                       v = V(g),
                      directed = TRUE,
                      weights = NULL,
                      nobigint = TRUE, 
                      normalized =FALSE)
BTW=as.matrix(betweenness(g)) 
which(BTW==max(BTW), arr.ind=T)
max(BTW)
closeness(
                      g, 
                      vids = V(g),
                      mode = c(
                       "total"), weights = NULL,
                      normalized = FALSE)
CLS=as.matrix(closeness(g)) 
which(CLS==max(CLS), arr.ind=T)
max(CLS)
alpha_centrality(
                      g,
                     nodes = V(g),
                     alpha = 1,
                     loops = FALSE,
                     exo = 1,
                     weights = NULL,
                     tol = 1e-07,
                     sparse = TRUE)
ALPH=as.matrix(alpha.centrality(g)) 
which(ALPH==max(ALPH), arr.ind=T)
max(ALPH)
ATHO<-C()
ATHO<-authority.score(
                    g,
                    scale= TRUE,
                    weights=NULL,
                    options = arpack_defaults)$vector
ATHO
which(ATHO==max(ATHO), arr.ind=T)
max(ATHO)
HUB<-C()
HUB<-hub.score(
                    g,
                    scale= TRUE,
                    weights=NULL,
                    options = arpack_defaults)$vector
HUB
which(HUB==max(HUB), arr.ind=T)
max(HUB)
