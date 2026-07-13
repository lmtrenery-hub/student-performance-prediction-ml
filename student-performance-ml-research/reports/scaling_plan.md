# Scaling Plan
## Session 12: Numerical Variables
## Purpose
The purpose of this scaling plan is to decide which numerical variables should be
scaled before machine-learning models are trained. Scaling is important because
some models are sensitive to the size and range of numeric features.
## Numeric Variable Review
The dataset was reviewed using the following Python code:
```python
num_cols = df.select_dtypes(include="number").columns.tolist()
print(df[num_cols].agg(["min", "max", "mean"]).T)

## Reflection Question

### Why do tree-based models care less about feature scaling than KNN or SVM?
[cite_start]Tree-based models care less about feature scaling because they split the data using threshold rules[cite: 395]. [cite_start]They mainly depend on the ordering of values, not the exact scale of the numbers[cite: 397]. [cite_start]KNN and SVM are more sensitive to scaling because KNN uses distance calculations to compare observations, and if one feature has a much larger numeric range than another, that feature can dominate the distance calculation[cite: 398, 399]. [cite_start]SVM is also sensitive to scale because it depends on margins and distances between observations[cite: 400]. [cite_start]Therefore, scaling is usually important for KNN and SVM, but it is usually not required for decision trees, random forests, or tree-based gradient boosting models[cite: 401].