<img src="../assets/logo_transparent.png" width="150" align="right" alt="Algo Professor"/>

# Sunday 4 — Embeddings, Retrieval & RAG

![Hours](https://img.shields.io/badge/Hours-16--20-2E7D32?style=for-the-badge) ![Project](https://img.shields.io/badge/P4-PolicyGPT-C9A227?style=for-the-badge)

**2 h hands-on teaching + 3 h real-time project work · GitHub submission by 18:00 local time**

| Material | File | Format |
|---|---|---|
| 📘 Student notes (slide-by-slide, elaborated) | [`notes/S04_Notes.pdf`](notes/S04_Notes.pdf) · [LaTeX source](notes/S04_Notes.tex) | PDF + LaTeX |
| 🏠 Mon–Sat project homework | [`HOMEWORK.md`](HOMEWORK.md) · also the last pages of the notes PDF | Markdown + PDF |
| 🖥️ Slides | [`slides/S04_Slides.pdf`](slides/S04_Slides.pdf) · [Beamer source](slides/S04_Slides.tex) | PDF + Beamer |
| 💻 Notebook (with outputs) | [`notebooks/S04_Retrieval_RAG.ipynb`](notebooks/S04_Retrieval_RAG.ipynb) · [Open in Colab](https://colab.research.google.com/github/drssnaiml1-cell/algoprofessor-ai-scientist/blob/main/sunday-04-retrieval-rag/notebooks/S04_Retrieval_RAG.ipynb) | Jupyter |
| 📊 Figures | [`figures/`](figures/) | PNG |

**Datasets used:** SST-2 (search corpus), TruthfulQA, Course syllabus PDF — downloaded automatically into `data/` the first time you run the notebook.

**Deliverable:** P4 — PolicyGPT. Tag your portfolio repo `sunday-4` and submit the release link before 18:00.

### Run it
```bash
pip install -r ../requirements.txt
jupyter lab notebooks/S04_Retrieval_RAG.ipynb
```

### Rebuild the PDFs
```bash
../build_materials.sh 4
```
