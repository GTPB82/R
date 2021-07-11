install.packages("igraph") 
library(igraph)
names<-as.matrix(read.table("C:/Users/giannhs/Documents/molecular_names.txt"))
edge_list<-as.matrix(read.table("C:/Users/giannhs/Documents/molecular_data.txt"))
g<-graph.edgelist(edge_list, directed=TRUE)
plot(g)
adj=get.adjacency(g)
View(adj)
AD_MATRX=as.matrix(adj)
View(AD_MATRX)
isSymmetric.matrix(AD_MATRX)
d = degree(g, mode="all")
t<-(d)
t
View(d)
get.shortest.paths(
  g,"4","8")
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