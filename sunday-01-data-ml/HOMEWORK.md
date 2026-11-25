<img src="../assets/logo_transparent.png" width="140" align="right" alt="Algo Professor"/>

# Week 1 homework — Credit Default Risk Scorer

**After Sunday 1, Monday to Saturday · about 2–3 hours a day**

> Banks must decide who gets credit and must be able to explain every decision. You will build a scorer that is accurate, cost-aware and explainable.

**Data:** UCI "Default of Credit Card Clients" (Taiwan, 30,000 clients, 23 features)  
**Submit:** commit every day; tag `week-1` and create a GitHub Release by **Saturday 23:59 local time**. Mentors review it before the next Sunday.

| Day | Assignment | Time |
|---|---|---|
| Monday | Exploratory data analysis report | 2–3 h |
| Tuesday | Baselines, pipelines and leakage audit | 2–3 h |
| Wednesday | Gradient boosting, tuning and a cost-aware threshold | 3 h |
| Thursday | Explainability and a fairness slice | 2–3 h |
| Friday | Experiment tracking, model card, reproducibility | 2 h |
| Saturday | Mini product and demo | 3 h |

## Monday — Exploratory data analysis report
*2–3 h* · **Goal:** Understand the data before modelling.

1. Download the dataset from the UCI ML Repository; write a data dictionary for all 23 features.
2. Profile missing values, duplicates, odd codes (e.g. EDUCATION values 0, 5, 6) and the default rate.
3. Plot default rate against credit limit, age, and the six repayment-status columns.
4. Write 5 findings and 5 open questions in `reports/eda.md`.

- **Deliverable:** `notebooks/01_eda.ipynb` and `reports/eda.md`
- **Done when:** Every feature documented; at least 6 plots each with a one-line interpretation; cleaning decisions justified.
- **Stretch:** Use `ydata-profiling` and list three things it found that you missed.

## Tuesday — Baselines, pipelines and leakage audit
*2–3 h* · **Goal:** Get an honest first score.

1. Create a stratified 70/15/15 split with a fixed seed.
2. Build a scikit-learn `Pipeline` with preprocessing inside it.
3. Train a dummy classifier, logistic regression and a decision tree; report ROC-AUC, F1 and recall with 5-fold CV.
4. Audit every feature: could it be known before the credit decision? Remove any that leak.

- **Deliverable:** `src/pipeline.py` and a results table in `reports/baselines.md`
- **Done when:** Dummy baseline reported; CV mean and std for every model; the test set not yet touched.
- **Stretch:** Add a calibration plot for the logistic model.

## Wednesday — Gradient boosting, tuning and a cost-aware threshold
*3 h* · **Goal:** Beat the baseline and choose a threshold the business can defend.

1. Train XGBoost or LightGBM with class weighting.
2. Tune 6+ hyperparameters with Optuna (at least 40 trials, CV on the training set).
3. Assume a missed defaulter costs 5× a wrongly refused good client; choose the threshold that minimises total cost on the validation set.
4. Evaluate once on the test set.

- **Deliverable:** `notebooks/03_boosting.ipynb` and a cost curve figure
- **Done when:** Tuned model compared with logistic regression; chosen threshold and expected cost reported with the confusion matrix.
- **Stretch:** Compare Optuna with random search at the same budget.

## Thursday — Explainability and a fairness slice
*2–3 h* · **Goal:** Explain decisions and check who the errors fall on.

1. Compute global SHAP importance and dependence plots for the top 3 features.
2. Write plain-English reason codes for 5 refused applicants (top 3 SHAP contributions each).
3. Compare recall, false-positive rate and approval rate by SEX and by EDUCATION group.
4. Write a half-page note: what would you tell a regulator?

- **Deliverable:** `reports/explainability.md` with SHAP figures and the group table
- **Done when:** Reason codes are understandable by a non-expert; group gaps reported with numbers, not adjectives.
- **Stretch:** Try Fairlearn's `ThresholdOptimizer` and report the accuracy–fairness trade-off.

## Friday — Experiment tracking, model card, reproducibility
*2 h* · **Goal:** Make the work repeatable by someone else.

1. Log every model run (parameters, metrics, artefacts) to MLflow with a SQLite backend.
2. Pin versions in `requirements.txt`; set seeds; add a `Makefile` or script that reproduces the final model.
3. Write `MODEL_CARD.md`: intended use, data, metrics, threshold, fairness findings, limits.
4. Ask a classmate to clone and reproduce your final score.

- **Deliverable:** MLflow database, `MODEL_CARD.md`, `Makefile`
- **Done when:** A fresh clone reproduces the test metrics to 3 decimal places.
- **Stretch:** Register the best model in the MLflow Model Registry with a stage.

## Saturday — Mini product and demo
*3 h* · **Goal:** Turn the model into something a loan officer could use.

1. Build a Streamlit app or FastAPI endpoint: input an applicant, return probability, decision and top reasons.
2. Validate inputs (ranges, allowed categories) and add 3 automated tests.
3. Record a 5-minute demo video; finish the project README.
4. Push, then tag `week-1` and create a GitHub Release.

- **Deliverable:** App code, tests, demo link, Release `week-1`
- **Done when:** App runs from the README instructions; tests pass; README explains problem, data, results, limits and AI-assistant use.
- **Stretch:** Deploy free on Hugging Face Spaces.
