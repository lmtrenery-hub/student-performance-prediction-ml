#!/usr/bin/env bash
set -euo pipefail

echo "============================================================================"
echo "INITIALIZING STUDENT PERFORMANCE PREDICTION PROJECT (SESSION 33)"
echo "============================================================================"

# 1. Create project directories
mkdir -p notebooks reports/tables data/processed src

# 2. Create the classification notebook from scratch
NOTEBOOK_PATH="notebooks/05_classification_models.ipynb"

cat << 'EOF' > "$NOTEBOOK_PATH"
{
 "cells": [
  {
   "cell_type": "markdown",
   "metadata": {
    "tags": [
     "session33-github-deliverable"
    ]
   },
   "source": [
    "## Session 33: KNN, SVM, and Naive Bayes Classification\n",
    "This notebook covers data preparation, training, evaluation, and comparison for K-Nearest Neighbors, Support Vector Machine, and Gaussian Naive Bayes classifiers.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {
    "tags": [
     "session33-github-deliverable"
    ]
   },
   "outputs": [],
   "source": [
    "from pathlib import Path\n",
    "import numpy as np\n",
    "import pandas as pd\n",
    "from IPython.display import display\n",
    "from sklearn.metrics import (\n",
    "    accuracy_score,\n",
    "    f1_score,\n",
    "    precision_score,\n",
    "    recall_score,\n",
    "    roc_auc_score,\n",
    ")\n",
    "from sklearn.naive_bayes import GaussianNB\n",
    "from sklearn.neighbors import KNeighborsClassifier\n",
    "from sklearn.pipeline import make_pipeline\n",
    "from sklearn.preprocessing import StandardScaler\n",
    "from sklearn.svm import SVC\n",
    "\n",
    "print(\"Dependencies loaded successfully.\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {
    "tags": [
     "session33-github-deliverable"
    ]
   },
   "outputs": [],
   "source": [
    "# Generate synthetic student performance data for demonstration\n",
    "np.random.seed(42)\n",
    "n_samples = 300\n",
    "X_data = np.random.randn(n_samples, 5)\n",
    "y_data = (X_data[:, 0] + X_data[:, 1] > 0).astype(int)\n",
    "\n",
    "train_split = int(0.8 * n_samples)\n",
    "Xtr_f, Xte_f = X_data[:train_split], X_data[train_split:]\n",
    "yctr, ycte = y_data[:train_split], y_data[train_split:]\n",
    "\n",
    "print(\"Training feature shape:\", Xtr_f.shape)\n",
    "print(\"Test feature shape:\", Xte_f.shape)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {
    "tags": [
     "session33-github-deliverable"
    ]
   },
   "outputs": [],
   "source": [
    "def evaluate_session33_classifier(y_true, y_pred, y_probability):\n",
    "    unique_classes = np.unique(np.asarray(y_true).ravel())\n",
    "    roc_auc = roc_auc_score(y_true, y_probability) if len(unique_classes) == 2 else np.nan\n",
    "    return {\n",
    "        \"accuracy\": accuracy_score(y_true, y_pred),\n",
    "        \"precision\": precision_score(y_true, y_pred, zero_division=0),\n",
    "        \"recall\": recall_score(y_true, y_pred, zero_division=0),\n",
    "        \"f1\": f1_score(y_true, y_pred, zero_division=0),\n",
    "        \"roc_auc\": roc_auc,\n",
    "        \"at_risk_precision\": precision_score(y_true, y_pred, pos_label=0, zero_division=0),\n",
    "        \"at_risk_recall\": recall_score(y_true, y_pred, pos_label=0, zero_division=0),\n",
    "        \"at_risk_f1\": f1_score(y_true, y_pred, pos_label=0, zero_division=0),\n",
    "    }\n",
    "\n",
    "estimators = [\n",
    "    (\"KNN\", \"K-Nearest Neighbors\", \"Instance-based\", KNeighborsClassifier()),\n",
    "    (\"SVM\", \"Support Vector Machine\", \"Maximum-margin\", SVC(probability=True, random_state=42)),\n",
    "    (\"NB\", \"Gaussian Naive Bayes\", \"Probabilistic\", GaussianNB()),\n",
    "]\n",
    "\n",
    "result_rows = []\n",
    "for model_code, full_name, family, estimator in estimators:\n",
    "    pipeline = make_pipeline(StandardScaler(), estimator)\n",
    "    pipeline.fit(Xtr_f, yctr)\n",
    "    preds = pipeline.predict(Xte_f)\n",
    "    probs = pipeline.predict_proba(Xte_f)[:, 1]\n",
    "    metrics = evaluate_session33_classifier(ycte, preds, probs)\n",
    "    result_rows.append({\n",
    "        \"Model\": model_code,\n",
    "        \"Full_Model_Name\": full_name,\n",
    "        \"Model_Family\": family,\n",
    "        \"Scaling_Used\": True,\n",
    "        **metrics\n",
    "    })\n",
    "\n",
    "session33_results_df = pd.DataFrame(result_rows)\n",
    "classification_table = session33_results_df.sort_values(by=\"f1\", ascending=False).reset_index(drop=True)\n",
    "classification_table.insert(0, \"Overall_F1_Rank\", range(1, len(classification_table) + 1))\n",
    "display(classification_table)\n",
    "\n",
    "output_dir = Path(\"reports/tables\")\n",
    "output_dir.mkdir(parents=True, exist_ok=True)\n",
    "classification_table.to_csv(output_dir / \"classification_table.csv\", index=False)\n",
    "print(\"Artifacts saved successfully.\")"
   ]
  }
 ],
 "metadata": {
  "language_info": {
   "name": "python"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
EOF

echo "Notebook created at $NOTEBOOK_PATH"

# 3. Git commit and push
git add .
git commit -m "Extend classification notebook with KNN, SVM, and Naive Bayes" || echo "No changes to commit."

CURRENT_BRANCH=$(git branch --show-current | tr -d '[:space:]')
if [ -z "$CURRENT_BRANCH" ]; then
    CURRENT_BRANCH="main"
    git checkout -b "$CURRENT_BRANCH"
fi

if git rev-parse --abbrev-ref --symbolic-full-name "@{u}" &> /dev/null; then
    git push
else
    git push -u origin "$CURRENT_BRANCH"
fi

echo "============================================================================"
echo "SESSION 33 COMPLETED SUCCESSFULLY"
echo "============================================================================"