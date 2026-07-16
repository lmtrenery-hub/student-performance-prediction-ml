import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from src.evaluate_models import eval_clf

# Load your cleaned data
df = pd.read_csv('data/processed/student_data.csv')

# Define features and target (G3 is your final grade)
X = df.drop('G3_binary', axis=1)
y = df['G3_binary']

# Split data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train the model
model = RandomForestClassifier()
model.fit(X_train, y_train)

# Predict and Evaluate
y_pred = model.predict(X_test)
y_proba = model.predict_proba(X_test)[:, 1]

# Use the evaluation module we created
results = eval_clf(y_test, y_pred, y_proba)
print("Model Performance Metrics:", results)