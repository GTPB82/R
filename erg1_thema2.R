# εγκαθιστω το  πακετο gplots
# install. Packages("gplots")
# Καλω την βιβλιοθήκη RColorBrewer
library(RColorBrewer)
#καλω την βιβλιοθήκη ggplot2
library(ggplot2)
#διαβάζω το αρχειο Differential_Expression.txt και αναθετω το περιεχομενο στην difexp
difexp <read.table(file="Differential_Expression.txt" ,header=T,sep="\t")
#αναθετω στη μεταβλητη y σαν πινακα  δεδομενων τα περιεχομενα του difexp
y<-data.frame(difexp)
#αφαιρω από την  y την πρωτη γραμμμη και στηλη
d<-y[-1,-1]
#μετατρεπω τον d  σε πινακα
d<-as.matrix(d)
#μετατρεπω τον d  πινακα σε αριθμητικο πινακα
d <- matrix(as.numeric(d),    
            ncol = ncol(d))
#αναθετω στην μεταβλητη sample  διανυσμα  με στοιχεια την πρωτη γραμμη από την δευτερη στηλη  εως την εβδομη 
sample<-c(y[1,2:7])
#αναθετω στην μεταβλητη genes  διανυσμα  με στοιχεια την δευτερη γραμμη εως την 2463 γραμμη από την πρωτη  στηλη 
genes<-c(y[2:2463,1])
#καλω την συναρτηση heatmap.2
heatmap.2(x=d,
          Colv=TRUE, #
          Rowv=TRUE, #
          distfun = dist,# μετρο αποστασης Ευκλειδεια 
          hclustfun = hclust, # ομαδοποιηση
          dendrogram=c("both"), # δενδρογραμμα για χy  αξονα
          scale=c("row"), #
          col= colorRampPalette(brewer.pal(10, "RdYlBu"))(256), # χρωματικη παλετα
          trace="none", #
          ColSideColors=rep(c("green","orange"), each=3), #
          labCol =sample, #labels   στον αξονα χ βασει της μεταβλητης  sample
          labRow=genes,  #labels   στον αξονα y βασει της μεταβλητης  genes
          ylab="Genes", xlab="Samples") # τιτλοι για  χy  αξονα
