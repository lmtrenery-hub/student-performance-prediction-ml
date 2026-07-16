# Student Performance Prediction Using Machine Learning
## Project Overview
This project studies how machine learning methods can be used to predict students'
academic performance using publicly available educational data.

The research focuses on identifying which academic, behavioral, family, and school-
related factors are associated with student performance. The project also compares

multiple supervised machine learning algorithms to determine which model yields the
strongest and most reliable predictive performance.
## Research Purpose
The purpose of this project is to move beyond a simple question, such as whether
machine learning can predict student performance. Instead, the project asks which
algorithm performs best, which variables are most important, and how interpretable
machine-learning results can support educational decision-making.

GSSRP 2026 - Kean University | Predicting Student Performance Using Machine Learning Session 1/48 - Week 1
## Central Research Question
Which factors best predict student academic performance, and which supervised
machine-learning algorithm provides the strongest and most reliable prediction
results?
## Dataset
This project will use the public UCI Student Performance dataset.
The dataset includes student-level information such as:
- Prior grades
- Study time
- Absences
- Family background
- Parental education
- School support
- Social and academic variables
## Planned Machine-Learning Methods
The project will compare several supervised machine-learning algorithms, including:
- Linear regression
- Logistic regression
- K-nearest neighbors
- Support vector machines
- Decision trees
- Random forest
- Gradient boosting
- Neural networks
## Planned Outputs
The final project will include:
- Cleaned dataset
- Exploratory data analysis
- Feature engineering
- Model training notebooks
- Model comparison results
- Evaluation metrics
- Feature-importance or interpretation results
- Final research report
- Reproducible GitHub documentation
## Program Structure
This project is designed for a 48-session research program.
```text
48 sessions × 2 hours = 96 total hours
### Session 22: Data Splitting and Validation
Completed the synchronization and validation of modeling datasets for two scenarios:
* **Full-information:** Includes academic progress indicators (G1, G2).
* **Early-warning:** Excludes G1 and G2 to evaluate predictive lead-time.

**Key Achievements:**
* Implemented deterministic splitting using `random_state=42`.
* Performed rigorous index-alignment validation across all training/test sets.
* Verified zero data leakage and confirmed 80/20 train/test distribution.
* Persisted modeling artifacts as Parquet files for downstream training sessions.