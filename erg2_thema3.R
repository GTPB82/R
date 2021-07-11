# install.packages("gplots")
library(RColorBrewer)
# library(ggplot2)
library(gplots)
difexp <-read.table(file="significantdata.tab" ,header=F,sep="\t")
y<-data.frame(difexp)
d<-y[-1,-1]
d<-as.matrix(d)
d <- matrix(as.numeric(d),
                                                ncol = ncol(d))
anotgroup<-matrix(c("BLC","BLC","BLC","BLC","BLC","BLC","BLC","BLC","nBLC","nBLC","nBLC","nBLC","nBLC","nBLC","nBLC","nBLC"))
anot1<-list(y[1,2:17])
anot1m<-matrix(unlist(anot1), ncol=1,nrow = 16)
annotationm<-data.frame(cbind(anotgroup,anot1m))
colnames(annotationm)=c("group","gene")

sample<-c(y[1,2:17])
genes<-c(y[2:101,1])




map<-function(annotations)
  colorsVector = ifelse(annotations["group"]=="BLC", 
                        "blue", ifelse(annotations["group"]=="BLC", 
                                      "yellow" ,"yellow"))
  return(colorsVector)

# Test heatmap.2 with column annotations and custom legend text
testHeatmap2<-function(d, annotations) {
  sampleColors = map(annotations)
  heatmap.2(d,
            Colv=TRUE,
            Rowv=TRUE,
            distfun = dist,
            hclustfun = hclust,
            dendrogram=c("both"),
            scale=c("row"),
            col= colorRampPalette(brewer.pal(10, "RdYlBu"))(256),
            trace="none",
            # ColSideColors=rep(c("green","orange"), each=d),
            labCol =sample,
            labRow=genes,
            ylab="Genes",
            xlab="Samples",
            margins=c(5,8),
            ColSideColors=sampleColors,
            key.xlab="",
            key=TRUE, symkey=FALSE, density.info="histogram")
}

testHeatmap2(d, annotationm)

title(main=expression(paste("100", " most expressed genes ",
                            )))

diagon<-c(d[1,1],d[2,2],d[3,3],d[4,4],d[9,9],d[10,10],d[11,11],d[12,12])
group1<-diagon[1:4]
group2<-diagon[5:8]
diagon
group1
group2
group<-c("BLC","nBLC")
genesnames1<-c(y[2:5,1])
genesnames2<-c(y[10:13,1])
genedata<-cbind(group1,group2)
genedata<-as.data.frame(genedata)
colnames(genedata)<-c(group[1:2])
row.names(genedata)<-c("diffexp1","diffexp2","diffexp3","diffexp4")

genedata
names<-c(genesnames1,genesnames2)
value=c(genedata)
dat = melt(genedata)
head(dat)

pdot<-ggplot(data=dat , mapping=aes(variable, value,  label=names)) +
  geom_point() +
  geom_boxplot()+
  geom_text(nudge_x=0.2)

plot(pdot)
