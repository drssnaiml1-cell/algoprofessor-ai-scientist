<img src="../assets/logo_transparent.png" width="140" align="right" alt="Algo Professor"/>

# Week 5 homework — Research Analyst Agent

**After Sunday 5, Monday to Saturday · about 2–3 hours a day**

> Analysts spend hours searching, reading and summarising. You will build an agent that does this with real tools, cites everything, stays inside safe limits and is measured honestly.

**Data:** Live arXiv API and web pages; GSM8K and a 30-task agent test suite you write  
**Submit:** commit every day; tag `week-5` and create a GitHub Release by **Saturday 23:59 local time**. Mentors review it before the next Sunday.

| Day | Assignment | Time |
|---|---|---|
| Monday | A tested tool layer | 3 h |
| Tuesday | A ReAct agent on a real LLM | 3 h |
| Wednesday | Planner–executor–critic with memory | 3 h |
| Thursday | Expose tools via MCP and review security | 3 h |
| Friday | A 30-task evaluation suite | 3 h |
| Saturday | Analyst report demo | 3 h |

## Monday — A tested tool layer
*3 h* · **Goal:** Give the agent reliable hands.

1. Implement 5 tools with JSON schemas: arXiv search, web page fetch (allow-listed domains), safe calculator, Python sandbox, notes store.
2. Add timeouts, retries with exponential backoff and rate limiting to network tools.
3. Write unit tests for every tool, including failure cases.

- **Deliverable:** `src/tools/`, `tests/test_tools.py`
- **Done when:** All tools validated against their schemas; tests cover timeouts and bad inputs.
- **Stretch:** Cache API results to disk to save cost and time.

## Tuesday — A ReAct agent on a real LLM
*3 h* · **Goal:** Replace the rule-based policy with a real model.

1. Use an LLM with native function calling (any provider or a local model via Ollama).
2. Implement the ReAct loop with a step limit and structured logging.
3. Add tracing with Langfuse or LangSmith; inspect 5 traces and note one improvement each.

- **Deliverable:** `src/agent.py`, trace screenshots in `reports/traces.md`
- **Done when:** Every run traced; step limit enforced; tool errors returned to the model instead of crashing.
- **Stretch:** Stream partial results to the console.

## Wednesday — Planner–executor–critic with memory
*3 h* · **Goal:** Make the agent check its own work.

1. Rebuild the agent as a LangGraph graph: planner, executor, critic, with a revise loop limited to 2 rounds.
2. Add long-term memory (notes store) so the agent reuses earlier findings.
3. Compare answers with and without the critic on 10 tasks.

- **Deliverable:** `src/graph.py`, comparison table
- **Done when:** Critic catches at least one real error in the comparison or you explain why not.
- **Stretch:** Let the critic check every citation against the fetched text.

## Thursday — Expose tools via MCP and review security
*3 h* · **Goal:** Make tools reusable and safe.

1. Write an MCP server exposing your tools with the official `mcp` SDK; connect it to an MCP client.
2. Threat-model the agent: prompt injection in fetched pages, data exfiltration, runaway loops, cost blow-ups.
3. Add mitigations: allow-lists, human approval for write actions, cost caps.

- **Deliverable:** `mcp_server.py`, `docs/security.md`
- **Done when:** At least 5 threats with a mitigation and a test each.
- **Stretch:** Add an approval prompt in the client for any write or send action.

## Friday — A 30-task evaluation suite
*3 h* · **Goal:** Measure success, cost and failure modes.

1. Write 30 tasks with checkable answers (literature questions, calculations, multi-hop lookups, 5 unanswerable).
2. Run the agent 3 times per task; report success rate ± standard error, mean steps, cost per task.
3. Build a failure taxonomy and fix the most common failure; re-run.

- **Deliverable:** `evals/tasks.jsonl`, `reports/agent_eval.md`
- **Done when:** Before/after numbers for the fix; unanswerable tasks scored on refusal.
- **Stretch:** Compare two different LLMs on the same suite.

## Saturday — Analyst report demo
*3 h* · **Goal:** Deliver a real piece of research.

1. Use the agent to produce a cited 2-page literature brief on a topic you choose.
2. Verify every citation by hand; record how many the agent got right.
3. Record a 5-minute demo; push, tag `week-5`, create a Release.

- **Deliverable:** Brief (PDF), demo link, Release `week-5`
- **Done when:** Every citation checked; citation accuracy reported honestly.
- **Stretch:** Publish the brief as a GitHub Pages page.
