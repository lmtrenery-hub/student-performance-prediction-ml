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