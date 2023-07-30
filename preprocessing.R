library(caret) 

# loop through files 
for (i in files) {
file_path <- file.path(data_dir, i)
data <- read.table(file_path)

# outcome variable that need to be processed 
outcome <- data.frame(data$y)

# standardize the outcome variable by dividing the mean with its stdev 
transformed <- preProcess(outcome, method=c("center", "scale"))
transformed <- predict(transformed, outcome)
transformed <- data.frame(transformed)
data <- data[, -1]
data <- cbind(transformed, data)
colnames(data)[1] <- "y"
