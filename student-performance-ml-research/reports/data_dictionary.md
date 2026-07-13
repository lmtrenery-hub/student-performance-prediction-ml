# Data Dictionary

## Project
Student Performance Prediction Using Machine Learning

## Purpose
This data dictionary describes the variables used in the student performance dataset. The variables are grouped into demographic, social, school-related, and academic feature groups.

## Summary
The dataset includes student background information, family and social information, school-related behavior, and academic performance variables. The final grade variable, G3, can serve as the primary prediction target.

## 1. Demographic Variables

| Variable | Description | Data Type | Missing Values |
|---|---|---|---|
| school | Student's school. | object | 0 |
| sex | Student's sex. | object | 0 |
| age | Student's age. | int64 | 0 |
| address | Student's home address type, such as urban or rural. | object | 0 |

## 2. Social Variables

| Variable | Description | Data Type | Missing Values |
|---|---|---|---|
| famsize | Student's family size category. | object | 0 |
| Pstatus | Parent cohabitation status. | object | 0 |
| Medu | Mother's education level. | int64 | 0 |
| Fedu | Father's education level. | int64 | 0 |
| Mjob | Mother's job category. | object | 0 |
| Fjob | Father's job category. | object | 0 |
| guardian | Student's guardian. | object | 0 |
| famrel | Quality of family relationships. | int64 | 0 |
| freetime | Student's free time after school. | int64 | 0 |
| goout | Frequency of going out with friends. | int64 | 0 |
| Dalc | Workday alcohol consumption. | int64 | 0 |
| Walc | Weekend alcohol consumption. | int64 | 0 |
| romantic | Whether the student is in a romantic relationship. | object | 0 |

## 3. School-Related Variables

| Variable | Description | Data Type | Missing Values |
|---|---|---|---|
| reason | Reason for choosing the school. | object | 0 |
| traveltime | Travel time from home to school. | int64 | 0 |
| studytime | Weekly study time category. | int64 | 0 |
| schoolsup | Whether the student receives extra school support. | object | 0 |
| famsup | Whether the student receives family educational support. | object | 0 |
| paid | Whether the student receives extra paid classes. | object | 0 |
| activities | Whether the student participates in extracurricular activities. | object | 0 |
| nursery | Whether the student attended nursery school. | object | 0 |
| higher | Whether the student wants to pursue higher education. | object | 0 |
| internet | Whether the student has internet access at home. | object | 0 |
| absences | Number of school absences. | int64 | 0 |

## 4. Academic Variables

| Variable | Description | Data Type | Missing Values |
|---|---|---|---|
| failures | Number of past class failures. | int64 | 0 |
| G1 | First-period grade. | int64 | 0 |
| G2 | Second-period grade. | int64 | 0 |
| G3 | Final grade. This is usually the main prediction target. | int64 | 0 |

## Interpretation Notes
The demographic variables describe basic student background information. The social variables include family structure, parents' education, parents' occupations, social behavior, and home environment. The school-related variables describe study habits, support systems, attendance, and school engagement. The academic variables describe previous academic performance. G3 is the final grade and can serve as the primary target variable for prediction.

## Modeling Note
If the project goal is full-information prediction, G1 and G2 may be included as predictors of G3. If the project goal is early-warning prediction, G1 and G2 should be excluded because they may introduce target leakage. In that case, the model should use only information available early in the semester.

## Target Variables

This project uses two target variables: one for regression and one for classification.

### Regression Target

| Variable | Type | Description | Use |
|---|---|---|---|
| `G3` | Numeric | Final student grade | Regression target |

`G3` is the original final grade variable. It is used when the goal is to predict the student's actual final grade.

### Classification Target

| Variable | Type | Description | Rule | Use |
|---|---|---|---|---|
| `passed` | Binary integer | Pass/fail outcome created from `G3` | `1` if `G3 >= 10`, else `0` | Classification target |

The `passed` variable is created from the final grade `G3` using the rule: `df["passed"] = (df["G3"] >= 10).astype(int)`.

* **1** = Student passed
* **0** = Student did not pass

### Chosen Threshold & Limitations
The chosen threshold is `G3 >= 10` for passing. Students with `G3 < 10` are considered at risk. 

**Limitation:** This creates a hard cutoff. A student with `G3 = 9` is labeled as not passing, while a student with `G3 = 10` is labeled as passing, even though their performance may be very similar.

**Final Decision:** For the first version of the project, the `G3 >= 10` threshold will be kept because it is simple, interpretable, and useful for creating a binary classification target. The limitation of the hard cutoff will be documented in the final report.

## Exploratory Data Analysis (EDA) Summary

### 1. Missing Values Evaluation
A check for missing or null data was completed using `df.isnull().sum()`. The dataset contains **0 missing values** across all columns, meaning no imputation steps are required before modeling.

### 2. Key Summary Statistics
* **Final Grade (G3):** Continuous numeric scale from 0 to 20. 
* **Prior Performance (G1 & G2):** Highly aligned with G3 distributions, functioning as strong early indicators.
* **Absences & Failures:** Show high variability, with a small group of students exhibiting highly elevated counts.

### 3. Correlation Insights with G3
Based on the computed correlation matrix, the following features have the strongest relationship with a student's final grade:

* **Strongest Positive Associations:** `G2` and `G1` (previous period grades show an extreme positive correlation with the final outcome).
* **Strongest Negative Associations:** `failures` (past class failures have a significant inverse relationship with academic achievement) and `absences`.

### 4. Analytical Approach Decision
Because `G1` and `G2` represent grades taken right before `G3`, they carry an exceptionally high risk of **target leakage** depending on how the early warning model is deployed. We will keep them documented but build model variants with and without them to evaluate predictive fairness.


### S9: Data Inspection Summary
The dataset contains 395 rows and 34 columns (including the engineered target). A total of 31 features are numeric (including G1, G2, G3, and the binary passed target), and 3 features are categorical (or 17 categorical before tracking adjustments depending on encoding). The target variable for classification (`passed`) is confirmed. No missing values were found across the features, meaning the dataset is structurally clean and ready for preprocessing.

# S9: Data Inspection
In this section, we inspect the dataset structure before cleaning and modeling. We check the dataset shape, column data types, missing-value information, and summary statistics.

## S9 Inspection Summary Note
The dataset inspection shows the structure, variable types, and basic summary statistics of the student performance dataset. The dataset contains **395 rows** and **34 columns** (including our newly created `passed` target)[cite: 2]. The `df.info()` output shows which variables are numeric and which are categorical, confirming that there are **0 missing values** across all columns[cite: 2].

From the `df.describe(include="all").T` output, three important observations are:
1. **Dataset Size:** The dataset contains 395 rows and 34 variables[cite: 2]. This sample size provides a solid baseline for training and testing our machine learning classification and regression models[cite: 2].
2. **Variable Types:** The majority of the columns are numeric, but several critical demographic and background columns are categorical (such as `school`, `sex`, `address`, `Mjob`, `Fjob`, and `reason`)[cite: 2]. These columns will require proper encoding before model training[cite: 2].
3. **Summary Statistics & Ranges:** The `absences` feature exhibits a massive range (from 0 to 75), indicating a heavily right-skewed distribution with a few extreme student outliers pulling the mean upward[cite: 2]. 

The next data cleaning steps are to explicitly isolate these categorical variables, prepare our encoding pipelines, and handle any potential outliers in the numeric attributes before moving into deeper visualizations[cite: 2].

---

## Student Activity: Summary Statistic Observations

| Number | Variable | Statistic | Observation | Why It Matters |
| :---: | :--- | :--- | :--- | :--- |
| **1** | `absences` | `min` / `max` | The range spans from 0 to 75 absences[cite: 2]. | This highlights extreme skewness and potential outliers; a few students miss an exceptional amount of school, which could heavily skew model predictions[cite: 2]. |
| **2** | `G3` / `passed` | `mean` vs `median` | The minimum final grade drops down to 0[cite: 2]. | A final grade of 0 requires auditing—it could represent an actual academic failure, a dropout student, or an unrecorded missing value[cite: 2]. |
| **3** | `Mjob` / `Fjob` | `top` / `freq` | Categorical variables display highly frequent "dominant" categories (like `other`)[cite: 2]. | These features cannot be passed straight to an ML algorithm and must be converted into numerical values via encoding techniques[cite: 2]. |

### Reflection Question
**Which summary statistic surprised you most, and what might explain it?**
The summary statistic that surprised me most was the maximum value of 75 in the `absences` variable[cite: 2]. It was surprising because the median student has very few absences, making 75 an extreme outlier[cite: 2]. This could be explained by a small number of students experiencing prolonged personal hardships, chronic medical issues, or total academic disengagement[cite: 2]. In data cleaning, we must decide whether to cap this variance so it doesn't disproportionately distort our model's weights[cite: 2].
---

## Session 9: Summary Statistic Observations

| Number | Variable | Statistic | Observation | Why It Matters |
| :---: | :--- | :--- | :--- | :--- |
| **1** | `absences` | `min` / `max` | The range spans from 0 to 75 absences. | This highlights extreme skewness and potential outliers; a few students miss an exceptional amount of school, which could heavily skew model predictions. |
| **2** | `G3` / `passed` | `mean` vs `median` | The minimum final grade drops down to 0. | A final grade of 0 requires auditing—it could represent an actual academic failure, a dropout student, or an unrecorded missing value. |
| **3** | `Mjob` / `Fjob` | `top` / `freq` | Categorical variables display highly frequent "dominant" categories (like `other`). | These features cannot be passed straight to an ML algorithm and must be converted into numerical values via encoding techniques. |

### Reflection Question
**Which summary statistic surprised you most, and what might explain it?**
The summary statistic that surprised me most was the maximum value of 75 in the `absences` variable. It was surprising because the median student has very few absences, making 75 an extreme outlier. This could be explained by a small number of students experiencing prolonged personal hardships, chronic medical issues, or total academic disengagement. In data cleaning, we must decide whether to cap this variance so it doesn't disproportionately distort our model's weights.
