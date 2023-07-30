library(bindata)
library(MASS) 

# ensure reproducibility
set.seed(123)

# data simulation
for (i in 1:1000) {

# number of observations 
no_of_obs <- 100

# number of variables 
no_of_var <- 150

# create a correlation matrix for the variables
# specify the value of r (strength of correlation) and the number of variables to be correlated 
corr_mat <- matrix(0.6, nrow=20, ncol=20)

# set the diagonal to 1 (correlation to itself)
diag(corr_mat) <- 1

# simulate correlated data 
corr_data <- rmvbin(no_of_obs, margprob=rep(0.5, 20), sigma=corr_mat)
colnames(corr_data) <- c(paste0("SNP", 1:20))
corr_data <- as.data.frame(corr_data)

# simulate uncorrelated data 
uncorr_data <- rbinom((no_of_obs*(no_of_var-20)), 1, 0.5)
uncorr_data <- matrix(data=uncorr_data, ncol=no_of_var-20, nrow=no_of_obs)
#colnames(uncorr_data) <- c(paste0("SNP", 1:150))
uncorr_data <- as.data.frame(uncorr_data)

# simulate error 
error <- rnorm(no_of_obs, 0, 1)

# simulate the outcome variable 
y <- 10*corr_data$SNP1 + 10*corr_data$SNP2 + 10*corr_data$SNP1*corr_data$SNP2 + error

dataset <- cbind(y, corr_data, uncorr_data)
colnames(dataset) <- c("y", paste0("SNP", 1:150))
}
