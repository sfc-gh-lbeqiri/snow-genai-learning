# Snowflake GenAI Learning

18 hands-on SQL labs for Solutions Architects — covering Cortex AI end-to-end. Organized as a **numbered learning journey** aligned with the **SnowPro Specialty: Generative AI** exam guide.

Every lab is a **Snowflake-native SQL Notebook** that runs directly in **Snowsight**. Each notebook is self-contained: environment setup, sample data creation, and feature demos are all inline. No external scripts, no Python, no local tooling.

---

## Prerequisites

| Requirement | Details |
|---|---|
| Snowflake account | Cortex AI enabled |
| Role | `DS_ROLE` (created below) |
| Warehouse | `DS_WH` (created below — XSmall is sufficient) |

Every notebook starts with `USE ROLE DS_ROLE` and `USE WAREHOUSE DS_WH`. If your environment uses different names, update the first cell in each notebook.

### One-Time RBAC Setup

Run [`a-admin-setup/notebook.ipynb`](a-admin-setup/notebook.ipynb) **before** any other lab. It creates `DS_ROLE`, `DS_WH`, and all required grants following [Snowflake RBAC best practices](https://docs.snowflake.com/en/user-guide/security-access-control-considerations):

- **USERADMIN** creates the role
- **SYSADMIN** creates the warehouse
- **SECURITYADMIN** manages grants and places `DS_ROLE` under `SYSADMIN` in the standard role hierarchy
- **SYSADMIN** creates `GENAI_LEARNING` database and grants `OWNERSHIP` to `DS_ROLE`

The notebook also includes a teardown cell to clean up when you're done.

---

## Getting Started

### Option A — Import the Full Repo (recommended)

1. **Snowsight** → **Projects** → **Notebooks** → **Create from repository**
2. Connect to `https://github.com/sfc-gh-lbeqiri/snow-genai-learning.git`
3. Open any `notebook.ipynb` → **Run All**

### Option B — Import a Single Notebook

1. Download a single `notebook.ipynb` from the repo
2. **Snowsight** → **Projects** → **Notebooks** → **Import .ipynb**
3. Select a warehouse and database → **Run All**

---

## Lab Map — Learning Journey

### Part 0: Admin Setup

| # | Lab | Topic | Description |
|---|---|---|---|
| 00 | [`a-admin-setup`](a-admin-setup/notebook.ipynb) | RBAC, Role Hierarchy | Create DS_ROLE, DS_WH, and all grants — run once before starting |

### Part 1: Foundations (Labs 01–03)

| # | Lab | Functions | Description |
|---|---|---|---|
| 01 | [`01-complete-basics`](b-foundations/01-complete-basics/notebook.ipynb) | `AI_COMPLETE` | Prompts, system/user messages, options, patterns, model comparison |
| 02 | [`02-complete-advanced`](b-foundations/02-complete-advanced/notebook.ipynb) | `AI_COMPLETE`, `AI_COUNT_TOKENS`, `TRY_COMPLETE`¹, `SPLIT_TEXT`¹ | Structured outputs (JSON mode), error handling, token management |
| 03 | [`03-embeddings-vectors`](b-foundations/03-embeddings-vectors/notebook.ipynb) | `AI_EMBED`, all 4 vector distances | Embeddings, storage, nearest-neighbor search |

### Part 2: AI Functions (Labs 04–08)

Paired complementary functions — learn two related tools per lab.

| # | Lab | Functions | Description |
|---|---|---|---|
| 04 | [`04-classify-sentiment`](c-ai-functions/04-classify-sentiment/notebook.ipynb) | `AI_CLASSIFY` + `AI_SENTIMENT` | Categorization with custom labels + continuous sentiment scoring |
| 05 | [`05-extract-filter`](c-ai-functions/05-extract-filter/notebook.ipynb) | `AI_EXTRACT` + `AI_FILTER` | Pull structure from text + semantic WHERE clauses |
| 06 | [`06-summarize-translate`](c-ai-functions/06-summarize-translate/notebook.ipynb) | `AI_SUMMARIZE_AGG` + `AI_TRANSLATE` | Text condensation + multilingual support + chaining |
| 07 | [`07-redact-parse`](c-ai-functions/07-redact-parse/notebook.ipynb) | `AI_REDACT` + `AI_PARSE_DOCUMENT` | PII masking + document OCR/layout extraction |
| 08 | [`08-agg-extract-answer`](c-ai-functions/08-agg-extract-answer/notebook.ipynb) | `AI_AGG` + `EXTRACT_ANSWER`¹ | Numbers-to-narrative + extractive QA |

### Part 3: Search & RAG (Labs 09–10)

| # | Lab | Functions | Description |
|---|---|---|---|
| 09 | [`09-cortex-search`](d-search-and-rag/09-cortex-search/notebook.ipynb) | Cortex Search Service | Managed semantic search: DDL, TARGET_LAG, hybrid search |
| 10 | [`10-rag-pattern`](d-search-and-rag/10-rag-pattern/notebook.ipynb) | `AI_EMBED` + Search + `AI_COMPLETE` | Full RAG pipeline: retrieve context → generate grounded answer |

### Part 4: Analyst & Agents (Labs 11–12)

| # | Lab | Functions | Description |
|---|---|---|---|
| 11 | [`11-cortex-analyst`](e-analyst-and-agents/11-cortex-analyst/notebook.ipynb) | Cortex Analyst, Semantic Views | Semantic models, VQR, suggested questions, custom_instructions |
| 12 | [`12-cortex-agent`](e-analyst-and-agents/12-cortex-agent/notebook.ipynb) | Cortex Agent REST API | Multi-tool orchestration: Search + Analyst + functions |

### Part 5: Production (Labs 13–15)

| # | Lab | Functions | Description |
|---|---|---|---|
| 13 | [`13-finetuning`](f-production/13-finetuning/notebook.ipynb) | `FINETUNE` | Training data format, job management, custom model inference |
| 14 | [`14-pipelines`](f-production/14-pipelines/notebook.ipynb) | Dynamic Tables + Streams + Tasks | Self-maintaining AI-enriched tables, event-driven processing |
| 15 | [`15-guard-safety`](f-production/15-guard-safety/notebook.ipynb) | Cortex Guard | Guardrails, prompt injection detection, hallucination checking |

### Part 6: Governance (Labs 16–18)

| # | Lab | Functions | Description |
|---|---|---|---|
| 16 | [`16-access-controls`](g-governance/16-access-controls/notebook.ipynb) | `CORTEX_MODELS_ALLOWLIST`, RBAC | Model allowlists, cross-region policy, network rules |
| 17 | [`17-cost-monitoring`](g-governance/17-cost-monitoring/notebook.ipynb) | ACCOUNT_USAGE views, `AI_COUNT_TOKENS` | Credit tracking, per-function costs, optimization strategies |
| 18 | [`18-observability`](g-governance/18-observability/notebook.ipynb) | Event Tables, LLM-as-Judge | Query history, telemetry, automated quality evaluation |

¹ No `AI_` prefixed equivalent yet — remains under `SNOWFLAKE.CORTEX` namespace.

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
- **Lab 09** — Creates a `CORTEX SEARCH SERVICE` using warehouse `DS_WH`.
- **Lab 10** — Depends on Lab 06 (wiki_articles) and Lab 09 (search service).
- **Lab 11** — Stages `sales_semantic_model.yaml` to `@semantic_models`. The PUT command is in the notebook.
- **Lab 12** — Documents the Agent REST API spec; actual agent calls require a Streamlit app or REST client.
- **Lab 13** — Shows fine-tuning syntax without executing (credit-intensive). Training data table is created.
- **Lab 14** — Creates a Dynamic Table and Task. Review cleanup notes at end of notebook.

---

## Teardown

Run the teardown cells at the bottom of [`a-admin-setup/notebook.ipynb`](a-admin-setup/notebook.ipynb) to drop the database, warehouse, and role.

To remove imported notebooks: **Snowsight** → **Projects** → **Notebooks** → select → **Delete**
