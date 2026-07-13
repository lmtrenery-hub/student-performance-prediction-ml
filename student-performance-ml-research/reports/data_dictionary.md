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