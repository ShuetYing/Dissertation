# compute the MVI 

# create a list to store the VIM values
vim_list <- list()

# loop through each file 
for (i in 1:length(files)) {
data <- read.table(files[i])

# split data into 80% training set and 20% testing set 
split <- caret::createDataPartition(data$y, p=0.8, list=FALSE)
train <- data[split, ]
test <- data[-split, ]

# specify the parameters of the model 
params <- expand.grid(size=, l2reg=, lambda=, learn_rate=, momentum=, gamma=, minibatchsz=, repeats=)

# train model with training set 
model <- caret::train(y ~ ., data=train, method="mlpSGD", tuneGrid=params)

# use r-squared as metric to measure which variable is most important 

# compute the microablation variable importance 

# loop through each variable 
constant <- 0
features <- paste0()
for (feature in features) {

# remove one variable at a time 
ablated_data <- test
ablated_data[[feature]] <- constant 
predictions <- predict(model, ablated_data)

# calculate r2
r2 <- R2(predictions, test$y)
vim_list[[feature]] <- c(vim_list[[feature]], r2)
}
}
