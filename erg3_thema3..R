
# install.packages("randomForest")
library(randomForest)
# install.packages("caret")
library(caret)
difexp <-read.table(file="WT_Differential_Expression_for_R.tab" ,header=T,sep="\t")
d<-t(difexp)

trainIndex <- createDataPartition(difexp$WT17_m, p = .8,
                                  list = FALSE,
                                  times = 1)

head(trainIndex)
difexpTrain <- d[trainIndex,]
difexpTest  <- d[-trainIndex,]
rf <- train(difexpTrain,
                     data = difexpTest,
                     method = "rf",
                     importance=TRUE,
                     metric = "Accuracy",
                     tuneGrid = tuneGrid,
                     trControl = trainControl( method = "cv",
                                               number=5,
                                               search = 'grid',
                                               classProbs = TRUE,
                                               savePredictions = "final"),
                     ntree = ntree
)