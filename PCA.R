# perform principal component analysis (PCA) on processed data to reduce the dimansionality 

# extract the variables and outcome 
x <- subset(data, select=-y)
y <- subset(data, select=y)

# perform PCA on the predictor variables 
# specify the number of PC (explain 95% variation)
pca <- prcomp(x, rank=70)

# extract the score 
x_pca <- pca$x

# combine data 
dataset <- cbind(y, x_pca)
colnames(dataset) <- c("y", paste0("PC", 1:70))
