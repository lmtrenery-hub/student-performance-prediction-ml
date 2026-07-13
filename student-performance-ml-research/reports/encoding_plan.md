# Encoding Plan

## Project
**Predicting Student Academic Success Using Interpretable Machine Learning, Public Educational Data, and Prompt-Engineered Research Workflows**

## Session
Session 11: Categorical Variables

## Purpose
This encoding plan documents how categorical variables will be converted into numeric features for machine learning. Most machine learning algorithms require numeric input, so categorical variables must be encoded before model training. The encoding strategy depends on whether each categorical variable is nominal, binary, or ordinal.

---

## Encoding Rules

### 1. Nominal Variables
Nominal variables contain categories with no natural order. Job categories or school reasons are labels only and should not be converted into artificial numeric rankings.
* **Encoding decision:** Use one-hot encoding.

### 2. Binary Variables
Binary variables contain only two categories (like yes/no values). 
* **Encoding decision:** Use binary encoding mapped to 0/1 values (e.g., yes = 1, no = 0).

### 3. Ordinal Variables
Ordinal variables contain categories with a meaningful order. 
* **Encoding decision:** Keep numeric ordinal variables as ordered numeric features, or use ordinal encoding only when the order is real and meaningful.

---

## Categorical Variable Encoding Plan

| Column | Example Values | Variable Type | Encoding Method | Reason |
| :--- | :--- | :--- | :--- | :--- |
| **school** | GP, MS | Binary/Nominal | Binary encoding | Two school categories; no ranking |
| **sex** | F, M | Binary/Nominal | Binary encoding | Two categories only |
| **address** | U, R | Binary/Nominal | Binary encoding | Urban and rural are labels |
| **famsize** | GT3, LE3 | Binary/Nominal | Binary encoding | Two family-size categories |
| **Pstatus** | A, T | Binary/Nominal | Binary encoding | Two parent-status categories |
| **Mjob** | at_home, health, other, services, teacher | Nominal | One-hot encoding | Job categories have no natural order |
| **Fjob** | teacher, other, services, health, at_home | Nominal | One-hot encoding | Job categories have no natural order |
| **reason** | course, other, home, reputation | Nominal | One-hot encoding | School-choice reasons are unordered labels |
| **guardian** | mother, father, other | Nominal | One-hot encoding | Guardian category has no ranking |
| **schoolsup** | yes, no | Binary | Binary encoding | Yes/no variable |
| **famsup** | no, yes | Binary | Binary encoding | Yes/no variable |
| **paid** | no, yes | Binary | Binary encoding | Yes/no variable |
| **activities** | no, yes | Binary | Binary encoding | Yes/no variable |
| **nursery** | yes, no | Binary | Binary encoding | Yes/no variable |
| **higher** | yes, no | Binary | Binary encoding | Yes/no variable |
| **internet** | no, yes | Binary | Binary encoding | Yes/no variable |
| **romantic** | no, yes | Binary | Binary encoding | Yes/no variable |

---

## Numeric Ordinal Variables
Some variables are already stored as numbers but represent ordered categories. These variables do not need one-hot encoding.

| Column | Variable Type | Encoding Decision | Reason |
| :--- | :--- | :--- | :--- |
| **Medu** | Ordinal | Keep numeric | Mother education level has ordered values |
| **Fedu** | Ordinal | Keep numeric | Father education level has ordered values |
| **traveltime** | Ordinal | Keep numeric | Travel-time levels are ordered |
| **studytime** | Ordinal | Keep numeric | Study-time levels are ordered |
| **failures** | Numeric/Ordinal | Keep numeric | Number of previous failures has numeric meaning |
| **famrel** | Ordinal | Keep numeric | Family relationship quality is ordered |
| **freetime** | Ordinal | Keep numeric | Free-time level is ordered |
| **goout** | Ordinal | Keep numeric | Going-out frequency is ordered |
| **Dalc** | Ordinal | Keep numeric | Workday alcohol consumption level is ordered |
| **Walc** | Ordinal | Keep numeric | Weekend alcohol consumption level is ordered |
| **health** | Ordinal | Keep numeric | Health status scale is ordered |

---

## High-Cardinality Check
A high-cardinality categorical variable has many unique categories, which can create too many columns after one-hot encoding. In this dataset, there are no major high-cardinality categorical variables. However, `Mjob`, `Fjob`, `reason`, and `guardian` contain more than two categories and are acceptable for one-hot encoding because their unique category count remains small.

---

## Reflection Question
### When would ordinal encoding mislead a model that assumes numeric distance is meaningful?

### Answer
Ordinal encoding can mislead a model when the categorical values are nominal rather than truly ordered. If categories are only labels, assigning numbers to them creates an artificial ranking that does not exist. 

For example, if the variable `Mjob` is encoded as *teacher = 1, health = 2, services = 3, other = 4, and at_home = 5*, a model may treat these values as ordered and equally spaced. This would incorrectly suggest that `at_home` is greater than `teacher` or that the difference between `teacher` and `health` has the same meaning as the difference between `services` and `other`. This is especially problematic for distance or magnitude-based models such as linear regression, logistic regression, KNN, SVM, and neural networks. For these unordered categories, one-hot encoding is much safer.