# calculate the emperical p-value
list <- vector("list", length(H0))

for (i in 1:length(H0)) {
count <- 0
for (j in 1:length(HA)) {
if (H0[i] > HA[j]) {
count <- count + 1
}
}
p_value <- count / length(H0)
list[[i]] <- p_value
}

# calculate power
# get the 5% threshold of null
threshold <- quantile(H0, 0.9995)
num_exceed_threshold <- sum(HA > threshold)
power <- (num_exceed_threshold/length(HA)) * 100

# calculate type I error 
threshold <- quantile(unlist(H0), 0.95)
error <- sum(H0 > threshold)
