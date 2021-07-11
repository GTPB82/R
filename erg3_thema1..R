# install.packages("matrixTests")
# install.packages("stargazer")   
library(stargazer)
library(qvalue)
library(matrixTests)
library(RColorBrewer)
library(gplots)
difexp <-read.table(file="WT_Differential_Expression_for_R.tab" ,header=T,sep="\t")
z<-data.frame(difexp)
d<-z[,-1]
d<-as.matrix(d)
d <- matrix(as.numeric(d), ncol = ncol(d))
x<-d[0:2463,1:4]
x<-as.matrix(x)
x <- matrix(as.numeric(x), ncol = ncol(x))
y<-d[0:2463,5:8]
y<-as.matrix(y)
y <- matrix(as.numeric(y), ncol = ncol(y))
p<-row_t_equalvar(x, y, alternative = "two.sided", mu = 0, conf.level = 0.95)
f<-p[,13]
q<-qvalue(f, fdr.level = NULL, pfdr = FALSE)
fdr1<-as.matrix(q[["qvalues"]])
A<-cbind(f,fdr1)
A<-as.data.frame(A)
names(A)[1] <- "P-VALUE"
names(A)[2] <- "qvalue"
B<-cbind.data.frame(difexp,A)
Sorted <- B[order(B[,11], decreasing = FALSE),]
Sorted<-as.data.frame(Sorted)
genes<-c(Sorted[1:30,1])
sampl<-c(Sorted[1,2:9])
sample<-colnames(Sorted)
samplef<-c(sample[2:9])
Sorted30<-Sorted[0:30,2:9]
Sorted30<-as.matrix(Sorted30)
Sorted30<- matrix(as.numeric(Sorted30),
            ncol = ncol(Sorted30))
# stargazer(Sorted,                 # Export txt
#           summary = FALSE,
#           type = "text",
#           out = "Pvalue.txt")
pdf(file="Heatmapsorted30")
heatmap.2(Sorted30,
          Colv=TRUE,
          Rowv=TRUE,
          distfun = dist,
          hclustfun = hclust,
          dendrogram=c("both"),
          scale=c("row"),
          col= colorRampPalette(brewer.pal(10, "RdYlBu"))(256),
          trace="none",
          labCol =samplef,
          labRow=genes,
          ylab="Genes",
          xlab="Samples",
          margins=c(5,8),
          key.xlab="",
          key=TRUE, symkey=FALSE, density.info="histogram")
dev.off()