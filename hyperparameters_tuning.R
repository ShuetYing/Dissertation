library(caret)
library(FCNN4R)

# 10-fold cross validation 
# divide the training data into 10 equal set : 9 for training, 1 for validation 
ctrl <- trainControl(method="cv", number=10, verboseIter=F)

# test different combinations of parameters 
params <- expand.grid(size=c(1:30), 
                      l2reg=c(0, 0.000001, 0.00001, 0.0001), 
                      lambda=c(0, 0.01, 0.001, 0.0001), 
                      learn_rate=c(0.1, 0.01), 
                      momentum=c(0.9, 0.95), 
                      gamma=1e-06, 
                      minibatchsz=c(10, 20),  
                      repeats=c(1:15)) 

# split data into test and train set 
split <- createDataPartition(data$y, p=.8, list=F)
train <- data[split, ]
test <- data[-split, ]

# train model with different parameters 
model <- train(y ~ ., data=train, method="mlpSGD", trControl=ctrl, tuneGrid=params)

# print the best performing parameters 
print(model$bestTune) 
