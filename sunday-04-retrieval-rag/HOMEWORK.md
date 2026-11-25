<img src="../assets/logo_transparent.png" width="140" align="right" alt="Algo Professor"/>

# Week 4 homework — PolicyGPT on Real Government Documents

**After Sunday 4, Monday to Saturday · about 2–3 hours a day**

> Students, parents and staff ask the same policy questions every day. You will build a cited assistant that answers from official documents and refuses to guess.

**Data:** NEP 2020 + at least 4 UGC/AICTE regulation PDFs (public), BEIR SciFact for retrieval benchmarking  
**Submit:** commit every day; tag `week-4` and create a GitHub Release by **Saturday 23:59 local time**. Mentors review it before the next Sunday.

| Day | Assignment | Time |
|---|---|---|
| Monday | Ingestion at real scale | 3 h |
| Tuesday | Neural embeddings and vector databases | 3 h |
| Wednesday | Hybrid search and a cross-encoder re-ranker | 2–3 h |
| Thursday | Grounded generation, abstention and prompt injection | 3 h |
| Friday | A 100-question golden set and RAGAS | 3 h |
| Saturday | Deploy PolicyGPT | 3 h |

## Monday — Ingestion at real scale
*3 h* · **Goal:** Turn messy PDFs into clean, citable chunks.

1. Download NEP 2020 and at least 4 UGC/AICTE regulation PDFs from official websites.
2. Parse with `pypdf`; detect scanned pages and OCR them (Tesseract); clean headers and footers.
3. Chunk by section headings where possible, with page, section and document metadata.
4. Write `reports/corpus_card.md` (sources, dates, page counts, known gaps).

- **Deliverable:** `src/ingest.py`, chunk store (JSONL), corpus card
- **Done when:** Every chunk traceable to document, page and section; OCR pages flagged.
- **Stretch:** Compare fixed-size vs heading-aware chunking on 20 questions.

## Tuesday — Neural embeddings and vector databases
*3 h* · **Goal:** Upgrade from LSA to real embeddings.

1. Embed chunks with `sentence-transformers` (e.g. `all-MiniLM-L6-v2` and one multilingual model).
2. Index in FAISS and Chroma (or pgvector).
3. Benchmark LSA vs MiniLM vs BM25 on BEIR SciFact: Recall@10 and nDCG@10.

- **Deliverable:** Benchmark table in `reports/retrieval.md`
- **Done when:** All retrievers scored with the same queries and metrics; index build time and size reported.
- **Stretch:** Test the multilingual model on 20 Hindi questions.

## Wednesday — Hybrid search and a cross-encoder re-ranker
*2–3 h* · **Goal:** Get the right passage into the top 3.

1. Implement hybrid retrieval with reciprocal-rank fusion.
2. Add a cross-encoder re-ranker (e.g. `cross-encoder/ms-marco-MiniLM-L-6-v2`) over the top 20.
3. Run an ablation: BM25, dense, hybrid, hybrid + re-ranker, on 50 of your own policy questions.

- **Deliverable:** Ablation table with hit@3 and MRR
- **Done when:** Each component's contribution measured on the same question set.
- **Stretch:** Tune the fusion constant and the number of candidates re-ranked.

## Thursday — Grounded generation, abstention and prompt injection
*3 h* · **Goal:** Answer only from sources.

1. Generate answers with an LLM (API or local Ollama) using a prompt that requires citations for every sentence.
2. Keep the coverage-based abstention rule; add a 'not in documents' answer path.
3. Plant a document chunk containing a malicious instruction ('ignore previous instructions…') and test that the system does not obey it.

- **Deliverable:** `src/answer.py`, injection test results
- **Done when:** Every answer sentence has a citation; the injection test passes or the failure is documented with a fix.
- **Stretch:** Add a check that each cited page actually contains the quoted fact.

## Friday — A 100-question golden set and RAGAS
*3 h* · **Goal:** Measure quality like a product team.

1. With your team, write 100 questions: 80 answerable (with gold page) and 20 unanswerable.
2. Split into dev (30) and test (70); tune thresholds on dev only.
3. Score faithfulness and answer relevance with `ragas`; add the golden set as a `pytest` regression test.

- **Deliverable:** `tests/golden.jsonl`, `tests/test_rag.py`, `reports/evaluation.md`
- **Done when:** Test set untouched during tuning; abstention accuracy and faithfulness reported.
- **Stretch:** Run the regression test in GitHub Actions on every push.

## Saturday — Deploy PolicyGPT
*3 h* · **Goal:** Make it usable by real people.

1. Serve with FastAPI; add a simple web page showing answers with clickable page citations.
2. Add rate limiting and logging of questions (no personal data).
3. Record a 5-minute demo; push, tag `week-4`, create a Release.

- **Deliverable:** Deployed app, demo link, Release `week-4`
- **Done when:** Citations open the right page; unanswerable questions are refused politely.
- **Stretch:** Add Hindi question support end to end.
