<img src="../assets/logo_transparent.png" width="150" align="right" alt="Algo Professor"/>

# Sunday 6 — Production, Responsible AI & Capstone

![Hours](https://img.shields.io/badge/Hours-26--30-1F4E9C?style=for-the-badge) ![Project](https://img.shields.io/badge/P6-Capstone%20in%20Production-C9A227?style=for-the-badge)

**2 h hands-on teaching + 3 h real-time project work · GitHub submission by 18:00 local time**

| Material | File | Format |
|---|---|---|
| 📘 Student notes | [`notes/S06_Notes.pdf`](notes/S06_Notes.pdf) · [LaTeX source](notes/S06_Notes.tex) | PDF + LaTeX |
| 🖥️ Slides | [`slides/S06_Slides.pdf`](slides/S06_Slides.pdf) · [Beamer source](slides/S06_Slides.tex) | PDF + Beamer |
| 💻 Notebook (with outputs) | [`notebooks/S06_Production_Responsible_AI.ipynb`](notebooks/S06_Production_Responsible_AI.ipynb) · [Open in Colab](https://colab.research.google.com/github/drssnaiml1-cell/algoprofessor-ai-scientist/blob/main/sunday-06-production-capstone/notebooks/S06_Production_Responsible_AI.ipynb) | Jupyter |
| 📊 Figures | [`figures/`](figures/) | PNG |

**Datasets used:** IBM Telco Customer Churn, California Housing (drift), UCI Adult (fairness), TruthfulQA (red-teaming) — downloaded automatically into `data/` the first time you run the notebook.

**Deliverable:** P6 — Capstone in Production. Tag your portfolio repo `sunday-6` and submit the release link before 18:00.

### Run it
```bash
pip install -r ../requirements.txt
jupyter lab notebooks/S06_Production_Responsible_AI.ipynb
```

### Rebuild the PDFs
```bash
../build_materials.sh 6
```
