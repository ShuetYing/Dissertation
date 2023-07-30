# compute the bias and coverage of the simulated data 

# list to store bias 
bias_list <- list()
mean_bias_list <- list()

# list to store coverage 
coverage_list <- list()
for (feature in features) {
coverage_list[[feature]] <- 0 
}
coverage_ratio <- list()

### calculate bias 

# loop through each file
for (i in 1:length(files)) {
data <- read.table(files[i])

# fit data into linear regression model
for (feature in features) {
formula <- as.formula(paste("y ~ ", features[1], "+", features[2], "+", features[1], ":", features[2]))  # for interaction association 
formula <- as.formula(paste("y ~ ", feature))   # for no and single association 
model <- lm(formula, data)

# get the coefficient for each variable in the data while excluding the intercept
coef <- coef(model)[-1]

# calculate bias 
bias <- coef - 0 

# store result 
bias_list[[feature]] <- c(bias_list[[feature]], bias)

# get the confidence interval and remove intercept 
confint <- confint(model)[-1, ]

# calculate coverage 

# check if the coefficient falls within 95% of the true value 
if (confint[1] <= 0 && confint[2] >= 0) {

# if falls within 95% C.I., count +1 
coverage_list[[feature]] <- coverage_list[[feature]] + 1
}
}
} 

# calculate mean of bias across the 1000 replicates 
for (feature in features) {
mean_bias_list[[feature]] <-  mean(bias_list[[feature]])
} 

# calculate coverage ratio 
for (feature in features) {
coverage_ratio[[feature]] <- coverage_list[[feature]] / length(files) 
} 
