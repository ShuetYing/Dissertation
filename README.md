# Dissertation
- MSc 2023 project
- Is machine learning and/or deep learning useful for genomic analysis?
- deep learning model to analyze genomic data using the 'multilayer perceptron (mlp) model with stochastic gradient descent algorithm'
- study whether the DL model is able to determine the true causal SNP when SNPs are in correlation 
- tested 3 different correlation level (no, weak and strong)
- tested 3 different association (no, single and interaction)

R codes: 
simulation.R : simulation of SNPs data 
hyperparameters tuning : manual grid search to tune model (the parameter of momentum & gamma are fixed)
QC.R : use linear model to perform quality check for the simulated data by calculating the bias and coverage
preprocessing.R : preprocess the data before fitting into model, apply 'center' and 'scale' method to data where the mean is divided by SD
microablation_variable_importance.R : compute the model performance in terms of R2 using the ablated test data 
permutation_variable_importance.R : compute the model performance in terms of R2 using the permuted test data 
statistical_analysis.R : compute the empirical p-value, type I error and power of the model   
