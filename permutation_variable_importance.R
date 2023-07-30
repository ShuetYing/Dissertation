# compute PVI

# create a list to store the VIM values
vim_list <- list()

# loop through files / replicates
for (i in 1:length(files)) {
data <- read.table(files[i])

# split data into 80% training set and 20% testing set 
split <- caret::createDataPartition(data$y, p=0.8, list=FALSE)
train <- data[split, ]
test <- data[-split, ]

# specify the parameters of the model 
params <- expand.grid(size=, l2reg=, lambda=, learn_rate=, momentum=, gamma=, minibatchsz=, repeats=)

# train model 
model <- train(y ~., data=train, method="mlpSGD", tuneGrid=params)

# loop through each variable 
features <- paste0()
for (feature in features) {

# permute the data 
permuted_data <- test
permuted_data[, feature] <- permuted_data[sample(nrow(permuted_data)), feature] 

# test model performance to compute VIM score 
predictions <- predict(model, permuted_data)
r2 <- R2(predictions, test$y)
vim_list[[feature]] <- c(vim_list[[feature]], r2)
} 
}
