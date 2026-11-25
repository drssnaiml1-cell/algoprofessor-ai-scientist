<img src="../assets/logo_transparent.png" width="140" align="right" alt="Algo Professor"/>

# Week 6 homework — Ship Your Capstone to Production

**After Sunday 6, Monday to Saturday · about 2–3 hours a day**

> A portfolio project that is deployed, monitored, audited and pitched is what convinces employers and investors. This week turns your best project into that.

**Data:** Your capstone data (from P1–P5), plus a simulated 'next month' batch for drift  
**Submit:** commit every day; tag `week-6` and create a GitHub Release by **Saturday 23:59 local time**. Mentors review it before the next Sunday.

| Day | Assignment | Time |
|---|---|---|
| Monday | Tests, container and CI | 3 h |
| Tuesday | Cloud deployment | 3 h |
| Wednesday | Monitoring, drift and retraining | 3 h |
| Thursday | Fairness, red-team and compliance audit | 3 h |
| Friday | Pitch and interview rehearsal | 3 h |
| Saturday | Final release and portfolio | 3 h |

## Monday — Tests, container and CI
*3 h* · **Goal:** Make every change safe.

1. Reach at least 80% test coverage on your service (`pytest --cov`).
2. Write a production Dockerfile (slim base, non-root user, health check).
3. Add a GitHub Actions workflow: lint, test, build the image on every push; add the CI badge to the README.

- **Deliverable:** Tests, `Dockerfile`, `.github/workflows/ci.yml`
- **Done when:** CI green on main; coverage report attached.
- **Stretch:** Add a vulnerability scan of the image (e.g. Trivy).

## Tuesday — Cloud deployment
*3 h* · **Goal:** Put it on the internet properly.

1. Deploy to a free or low-cost platform (Hugging Face Spaces, Render, Railway, or a cloud VM).
2. Manage secrets with environment variables or the platform's secret store — never in Git.
3. Add `/health`, request logging and a simple uptime check.

- **Deliverable:** Live URL, deployment notes in `docs/deploy.md`
- **Done when:** A stranger can use the live URL; no secret appears in the repository history.
- **Stretch:** Add a staging environment and promote to production from a tag.

## Wednesday — Monitoring, drift and retraining
*3 h* · **Goal:** Notice when the world changes.

1. Create a 'next month' batch with a realistic shift (e.g. new customer mix).
2. Produce an Evidently drift report; define an alert rule (e.g. PSI > 0.25 on any top-5 feature).
3. Write a retraining script that registers a new model version and compares it with the current one.

- **Deliverable:** Drift report, alert rule, `scripts/retrain.py`
- **Done when:** Alert fires on the shifted batch; new version only promoted if it beats the old one.
- **Stretch:** Schedule the drift check with GitHub Actions cron.

## Thursday — Fairness, red-team and compliance audit
*3 h* · **Goal:** Earn trust before launch.

1. Measure fairness metrics for relevant groups; try one mitigation; report the trade-off.
2. Run a red-team session with 20 probes across at least 5 risk categories; log severity and fixes.
3. Fill an EU AI Act risk-tier and India DPDP Act checklist for your system.

- **Deliverable:** `docs/audit.md`
- **Done when:** Numbers for every claim; each high-severity finding has a fix or an explicit acceptance.
- **Stretch:** Ask another team to red-team your system and include their findings.

## Friday — Pitch and interview rehearsal
*3 h* · **Goal:** Practise the conversation that gets you hired or funded.

1. Build the 7-minute Demo Day deck from your real results.
2. Record a full rehearsal; cut anything over time.
3. Do a 45-minute mock interview with a peer: one system-design question about your capstone and two STAR behavioural questions.

- **Deliverable:** Deck (PDF), rehearsal recording link, interview feedback notes
- **Done when:** Pitch within 7 minutes; every number on slides traceable to your repository.
- **Stretch:** Pitch to someone outside tech and note what confused them.

## Saturday — Final release and portfolio
*3 h* · **Goal:** Finish strong.

1. Tag `v1.0` and create a Release with notes, model card and audit attached.
2. Polish your portfolio README so it links all six projects with one-line results each.
3. Write a LinkedIn post about your capstone; complete the certification checklist.

- **Deliverable:** Release `v1.0`, portfolio README, post link
- **Done when:** All six projects linked with working demos or clear run instructions.
- **Stretch:** Write a technical blog post on your hardest bug and how you found it.
