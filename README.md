# Snowflake GenAI Learning

18 hands-on SQL labs for Solutions Architects — covering Cortex AI end-to-end. Organized as a **numbered learning journey** aligned with the **SnowPro Specialty: Generative AI** exam guide.

Every lab is a **Snowflake-native SQL Notebook** that runs directly in **Snowsight**. Each notebook is self-contained: environment setup, sample data creation, and feature demos are all inline. No external scripts, no Python, no local tooling.

---

## Prerequisites

| Requirement | Details |
|---|---|
| Snowflake account | Cortex AI enabled |
| Warehouse | Any active warehouse (`COMPUTE_WH` used by default, XSmall is fine) |
| Role | `ACCOUNTADMIN` or a role with `CREATE DATABASE` privileges |

---

## Getting Started

### Option A — Snowflake Workspace

1. **Snowsight** → **Projects** → **Workspaces** → **+ Workspace** → name it **`genai-labs`**
2. In the workspace terminal:
   ```bash
   git clone https://github.com/sfc-gh-lbeqiri/snow-genai-learning.git .
   ```
3. Open any `notebook.ipynb` → **Run All**

### Option B — Snowsight Notebooks (no workspace)

1. Download a single `notebook.ipynb` from the repo
2. **Snowsight** → **Projects** → **Notebooks** → **Import .ipynb**
3. Select a warehouse and database → **Run All**

---

## Lab Map — Learning Journey

### Part 1: Foundations (Labs 01–03)

| # | Lab | Functions | Description |
|---|---|---|---|
| 01 | [`01-complete-basics`](01-foundations/01-complete-basics/) | `COMPLETE` | Prompts, system/user messages, options, patterns, model comparison |
| 02 | [`02-complete-advanced`](01-foundations/02-complete-advanced/) | `TRY_COMPLETE`, `COUNT_TOKENS`, `SPLIT_TEXT` | Structured outputs (JSON mode), error handling, token management |
| 03 | [`03-embeddings-vectors`](01-foundations/03-embeddings-vectors/) | `EMBED_TEXT_768/1024`, all 4 vector distances | Embeddings, storage, nearest-neighbor search |

### Part 2: AI Functions (Labs 04–08)

Paired complementary functions — learn two related tools per lab.

| # | Lab | Functions | Description |
|---|---|---|---|
| 04 | [`04-classify-sentiment`](02-ai-functions/04-classify-sentiment/) | `AI_CLASSIFY` + `AI_SENTIMENT` | Categorization with custom labels + continuous sentiment scoring |
| 05 | [`05-extract-filter`](02-ai-functions/05-extract-filter/) | `AI_EXTRACT` + `AI_FILTER` | Pull structure from text + semantic WHERE clauses |
| 06 | [`06-summarize-translate`](02-ai-functions/06-summarize-translate/) | `AI_SUMMARIZE` + `AI_TRANSLATE` | Text condensation + multilingual support + chaining |
| 07 | [`07-redact-parse`](02-ai-functions/07-redact-parse/) | `AI_REDACT` + `AI_PARSE_DOCUMENT` | PII masking + document OCR/layout extraction |
| 08 | [`08-agg-extract-answer`](02-ai-functions/08-agg-extract-answer/) | `AI_AGG` + `EXTRACT_ANSWER` | Numbers-to-narrative + extractive QA |

### Part 3: Search & RAG (Labs 09–10)

| # | Lab | Functions | Description |
|---|---|---|---|
| 09 | [`09-cortex-search`](03-search-and-rag/09-cortex-search/) | Cortex Search Service | Managed semantic search: DDL, TARGET_LAG, hybrid search |
| 10 | [`10-rag-pattern`](03-search-and-rag/10-rag-pattern/) | Embed + Search + Complete | Full RAG pipeline: retrieve context → generate grounded answer |

### Part 4: Analyst & Agents (Labs 11–12)

| # | Lab | Functions | Description |
|---|---|---|---|
| 11 | [`11-cortex-analyst`](04-analyst-and-agents/11-cortex-analyst/) | Cortex Analyst, Semantic Views | Semantic models, VQR, suggested questions, custom_instructions |
| 12 | [`12-cortex-agent`](04-analyst-and-agents/12-cortex-agent/) | Cortex Agent REST API | Multi-tool orchestration: Search + Analyst + functions |

### Part 5: Production (Labs 13–15)

| # | Lab | Functions | Description |
|---|---|---|---|
| 13 | [`13-finetuning`](05-production/13-finetuning/) | `FINETUNE` | Training data format, job management, custom model inference |
| 14 | [`14-pipelines`](05-production/14-pipelines/) | Dynamic Tables + Streams + Tasks | Self-maintaining AI-enriched tables, event-driven processing |
| 15 | [`15-guard-safety`](05-production/15-guard-safety/) | Cortex Guard | Guardrails, prompt injection detection, hallucination checking |

### Part 6: Governance (Labs 16–18)

| # | Lab | Functions | Description |
|---|---|---|---|
| 16 | [`16-access-controls`](06-governance/16-access-controls/) | `CORTEX_MODELS_ALLOWLIST`, RBAC | Model allowlists, cross-region policy, network rules |
| 17 | [`17-cost-monitoring`](06-governance/17-cost-monitoring/) | ACCOUNT_USAGE views, `COUNT_TOKENS` | Credit tracking, per-function costs, optimization strategies |
| 18 | [`18-observability`](06-governance/18-observability/) | Event Tables, LLM-as-Judge | Query history, telemetry, automated quality evaluation |

---

## Exam Coverage

These 18 labs map to the **SnowPro Specialty: Generative AI** exam domains:

| Exam Domain | Weight | Labs |
|---|---|---|
| **1.0 Gen AI Overview** | 30% | 01–03 (foundations), 09–12 (search, RAG, analyst, agent), 13 (fine-tuning) |
| **2.0 Gen AI & LLM Functions** | 44% | 01–14 (all functions, search, RAG, analyst, agent, pipelines) |
| **3.0 Gen AI Governance** | 26% | 07 (redact), 15 (guard), 16 (access), 17 (cost), 18 (observability) |

---

## Notes on Specific Labs

- **Lab 07** — `AI_PARSE_DOCUMENT` requires PDFs on the `@invoice_pdfs` stage. Upload via Snowsight or PUT.
- **Lab 09** — Creates a `CORTEX SEARCH SERVICE` using warehouse `COMPUTE_WH`. Edit if your warehouse differs.
- **Lab 10** — Depends on Lab 06 (wiki_articles) and Lab 09 (search service).
- **Lab 11** — Stages `sales_semantic_model.yaml` to `@semantic_models`. The PUT command is in the notebook.
- **Lab 12** — Documents the Agent REST API spec; actual agent calls require a Streamlit app or REST client.
- **Lab 13** — Shows fine-tuning syntax without executing (credit-intensive). Training data table is created.
- **Lab 14** — Creates a Dynamic Table and Task. Review cleanup notes at end of notebook.

---

## Teardown

Remove all objects created by the labs:

```sql
DROP DATABASE IF EXISTS GENAI_LEARNING;
```

Delete the workspace: **Snowsight** → **Projects** → **Workspaces** → `genai-labs` → **Delete**
