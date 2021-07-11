
dist_M<-read.table(file="distance-matrix.tab", header=TRUE)
d<-as.matrix(dist_M)

cmdscale(d, k = 3, eig = FALSE, add = FALSE, x.ret = FALSE)
mds1 = cmdscale(dist_M, k = 3)
x<-mds1[,1]
y<-mds1[,2]

plot(x,y, type = "p", xlab = "", ylab = "", axes = TRUE,
     main = "cmdscale (stats)")
text(mds1[,1], mds1[,2] ,labels(x), cex = 0.9, xpd = TRUE)