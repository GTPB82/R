# ��������� ��  ������ gplots
# install. Packages("gplots")
# ���� ��� ���������� RColorBrewer
library(RColorBrewer)
#���� ��� ���������� ggplot2
library(ggplot2)
#������� �� ������ Differential_Expression.txt ��� ������� �� ����������� ���� difexp
difexp <read.table(file="Differential_Expression.txt" ,header=T,sep="\t")
#������� ��� ��������� y ��� ������  ��������� �� ����������� ��� difexp
y<-data.frame(difexp)
#������ ��� ���  y ��� ����� ������� ��� �����
d<-y[-1,-1]
#��������� ��� d  �� ������
d<-as.matrix(d)
#��������� ��� d  ������ �� ���������� ������
d <- matrix(as.numeric(d),    
            ncol = ncol(d))
#������� ���� ��������� sample  ��������  �� �������� ��� ����� ������ ��� ��� ������� �����  ��� ��� ������ 
sample<-c(y[1,2:7])
#������� ���� ��������� genes  ��������  �� �������� ��� ������� ������ ��� ��� 2463 ������ ��� ��� �����  ����� 
genes<-c(y[2:2463,1])
#���� ��� ��������� heatmap.2
heatmap.2(x=d,
          Colv=TRUE, #
          Rowv=TRUE, #
          distfun = dist,# ����� ��������� ���������� 
          hclustfun = hclust, # �����������
          dendrogram=c("both"), # ������������ ��� �y  �����
          scale=c("row"), #
          col= colorRampPalette(brewer.pal(10, "RdYlBu"))(256), # ��������� ������
          trace="none", #
          ColSideColors=rep(c("green","orange"), each=3), #
          labCol =sample, #labels   ���� ����� � ����� ��� ����������  sample
          labRow=genes,  #labels   ���� ����� y ����� ��� ����������  genes
          ylab="Genes", xlab="Samples") # ������ ���  �y  �����
