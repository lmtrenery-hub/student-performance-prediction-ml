To ensure your `notes/session_17_correlation_note.md` is comprehensive and meets the Kean University research standards for the GSSRP program, I have drafted the structure below. You can copy this into your file, filling in the placeholders with the data you generated in the notebook.

---

### Session 17: Correlation Analysis & Data Leakage

#### 1. Summary

The objective of this session was to perform an Exploratory Data Analysis (EDA) on the numeric features of the student performance dataset to understand the linear relationships between predictors and the target variable, `G3`. We utilized a correlation heatmap to visualize these relationships and statistical sorting to identify the most significant predictors.

#### 2. Interpretation of Findings

* **Strongest Correlates:** The most influential variables identified were `G1` and `G2`. Their correlation coefficients with `G3` were **[INSERT G1 VALUE]** and **[INSERT G2 VALUE]**, respectively.
* **Observed Patterns:** The heatmap indicates a clear positive relationship between period grades and final performance.
* **The Leakage Concern:** This analysis identified a significant case of **temporal data leakage**. Because `G1` and `G2` are earlier iterations of the same course assessment as `G3`, they contain information from the future of the target variable. Including these in a model intended to predict final grades at the start of the term would lead to overfitting and artificially inflated performance metrics.

#### 3. Recommendation

For the next phase of the project:

1. **Model Separation:** I will develop two distinct model architectures—one including `G1` and `G2` for maximum accuracy, and one excluding them for realistic early-intervention utility.
2. **Feature Engineering:** Given the high redundancy between `G1`, `G2`, and `G3`, I will investigate creating new features (e.g., `grade_improvement` or `average_grade`) to replace the individual raw grade columns to reduce multicollinearity.

---

### Understanding Data Leakage

To effectively present your research, it is helpful to conceptualize why this happens. Data leakage occurs when information from the target is inadvertently included in the training features.

When you visualize this as a matrix, the "clumping" of high-intensity colors around the `G1`, `G2`, `G3` intersection demonstrates how the model will prioritize these features over more meaningful but less correlated demographic or social predictors.

---

**Does this draft cover the key points you wanted to highlight, or would you like to add specific observations from your own dataset's heatmap?**