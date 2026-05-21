# Dissertation Project

## MSc Project (2023)

### Project Title
**Is Machine Learning and/or Deep Learning Useful for Genomic Analysis?**

---

# Project Overview

This project investigates the application of deep learning methods for genomic data analysis, specifically focusing on identifying causal single nucleotide polymorphisms (SNPs) under different correlation and association structures.

A deep learning model based on a **Multilayer Perceptron (MLP)** architecture with a **Stochastic Gradient Descent (SGD)** optimization algorithm was developed and evaluated.

The study aims to determine whether the deep learning model can correctly identify the true causal SNP when SNPs exhibit varying levels of correlation.

---

# Objectives

- Develop a deep learning framework for genomic analysis
- Evaluate the ability of the model to identify true causal SNPs
- Investigate model performance under different SNP correlation structures
- Assess model performance under different SNP association patterns

---

# Experimental Design

## Correlation Structures Tested

Three levels of SNP correlation were evaluated:

- No correlation
- Weak correlation
- Strong correlation

---

## Association Structures Tested

Three association scenarios were evaluated:

- No association
- Single association
- Interaction association

---

# Deep Learning Model

## Model Architecture

- Multilayer Perceptron (MLP)

## Optimization Algorithm

- Stochastic Gradient Descent (SGD)

---

# Project Workflow

1. Simulate SNP datasets
2. Perform quality control analysis
3. Preprocess genomic data
4. Tune hyperparameters
5. Train deep learning models
6. Evaluate variable importance
7. Perform statistical analysis
8. Apply dimensionality reduction using PCA

---

# R Scripts Description

## `simulation.R`

Simulates SNP datasets under different:
- Correlation structures
- Association structures

The script generates synthetic genomic datasets for model training and evaluation.

---

## `hyperparameters_tuning.R`

Performs manual grid search for hyperparameter tuning.

### Tuned Parameters
- Learning rate
- Number of hidden units
- Other model parameters

### Fixed Parameters
- Momentum
- Gamma

---

## `QC.R`

Performs quality control analysis on the simulated datasets using linear models.

### Metrics Computed
- Bias
- Coverage

This step ensures the simulated data behaves according to the intended statistical properties.

---

## `preprocessing.R`

Preprocesses the genomic data before model training.

### Methods Applied
- Centering
- Scaling

The preprocessing standardizes the data by:
- Subtracting the mean
- Dividing by the standard deviation (SD)

---

## `microablation_variable_importance.R`

Computes variable importance using a microablation approach.

### Evaluation Metric
- R² (Coefficient of Determination)

The script evaluates model performance using ablated test datasets.

---

## `permutation_variable_importance.R`

Computes variable importance using permutation-based analysis.

### Evaluation Metric
- R² (Coefficient of Determination)

The script evaluates model performance using permuted test datasets.

---

## `statistical_analysis.R`

Performs statistical evaluation of the model.

### Metrics Computed
- Empirical p-value
- Type I error
- Statistical power

---

## `PCA.R`

Applies Principal Component Analysis (PCA) to the simulated genomic datasets.

### Purpose
- Reduce dimensionality
- Reduce the number of variables
- Improve computational efficiency

---

# Methods Summary

| Component | Method |
|---|---|
| Deep Learning Model | Multilayer Perceptron (MLP) |
| Optimization Algorithm | Stochastic Gradient Descent (SGD) |
| Data Type | Simulated SNP Data |
| Preprocessing | Centering and Scaling |
| Variable Importance | Microablation and Permutation |
| Dimensionality Reduction | Principal Component Analysis (PCA) |
| Statistical Evaluation | Empirical p-value, Type I Error, Power |

---

# Research Focus

This project explores the effectiveness of deep learning approaches in genomic studies, particularly in identifying causal genetic variants in the presence of correlated SNPs and interaction effects.

The findings contribute to understanding:
- The robustness of deep learning methods in genomic analysis
- The impact of SNP correlation on model interpretability
- The usefulness of deep learning for causal SNP detection

---
