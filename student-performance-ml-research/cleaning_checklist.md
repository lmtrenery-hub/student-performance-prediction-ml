# Cleaning Checklist

## Project
Student Performance Prediction Using Machine Learning

## Session
Session 10: Missing Values and Duplicates

## Purpose
The purpose of this checklist is to document the data-quality checks completed before preprocessing, feature engineering, and model development. The dataset was checked for missing values and duplicate rows to make sure that downstream machine-learning models are not affected by silent data-quality problems.

## 1. Missing Values Check

### Python Code Used
```python
print("Missing per column:")
print(df.isna().sum())

## 4. Data Quality and Cleaning Summary

### Missing Values Verification
[cite_start]An analysis of the dataset was conducted using `df.isna().sum()` to check every column for missing data, and `df.isna().sum().sum()` to confirm the total count across the entire dataset[cite: 77, 212]. 
* [cite_start]**Result:** Every column returned a missing value count of exactly **0**, confirming a total of **0** missing values across the entire dataset[cite: 81, 215].
* [cite_start]**Decision:** No missing-value imputation or data patching is required[cite: 83].
* [cite_start]**Justification:** Because the dataset is completely full and matches the original UCI documentation claims, attempting to apply an imputation algorithm would be redundant and could introduce artificial patterns or noise into the variables[cite: 85, 193].

### Duplicate Rows Verification
[cite_start]A duplicate record check was performed using `df.duplicated().sum()` to ensure no duplicate rows exist in the working data dataframe[cite: 87, 88].
* [cite_start]**Result:** The check returned a count of exactly **0** duplicate rows[cite: 90].
* [cite_start]**Decision:** No rows need to be dropped or removed from the dataset[cite: 92].
* [cite_start]**Justification:** A duplicate row count of zero ensures that the model will not be biased by over-weighting repeated observations, protecting the integrity of both training and evaluation phases[cite: 94].