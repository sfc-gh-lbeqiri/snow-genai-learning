# Snowflake GenAI Learning

Hands-on learning for Snowflake Solutions Architects — 13 labs covering Cortex AI across structured, semi-structured, and unstructured data.

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
   Or download the ZIP and drag-and-drop into the workspace file browser.
3. Open any `notebook.ipynb` → **Run All**

### Option B — Snowsight Notebooks (no workspace)

1. Download a single `notebook.ipynb` from the repo
2. **Snowsight** → **Projects** → **Notebooks** → **Import .ipynb**
3. Select a warehouse and database → **Run All**

---

## Running a Lab

Each notebook runs top-to-bottom with no prerequisites beyond a warehouse:

1. **Open** the notebook in Snowsight (or a workspace)
2. **Select a warehouse** if prompted
3. **Run All** — the first cells create `GENAI_LEARNING` database, tables, and sample data

That's it. Every lab creates its own objects and data inline.

---

## Recommended Order

Later labs build on objects created by earlier ones. Run in this sequence:

| # | Lab | Feature | Notes |
|---|---|---|---|
| 1 | `structured/ai-classify-orders/notebook.ipynb` | `AI_CLASSIFY` | |
| 2 | `structured/ai-sentiment-reviews/notebook.ipynb` | `AI_SENTIMENT` | |
| 3 | `structured/ai-agg-sales/notebook.ipynb` | `AI_AGG` | |
| 4 | `structured/cortex-analyst-sales/notebook.ipynb` | Cortex Analyst | Stages a YAML semantic model |
| 5 | `semi-structured/ai-extract-logs/notebook.ipynb` | `AI_EXTRACT` | |
| 6 | `semi-structured/ai-filter-feedback/notebook.ipynb` | `AI_FILTER` | |
| 7 | `semi-structured/ai-translate-catalog/notebook.ipynb` | `AI_TRANSLATE` | |
| 8 | `semi-structured/cortex-complete-general/notebook.ipynb` | `CORTEX.COMPLETE` | |
| 9 | `unstructured/ai-summarize-articles/notebook.ipynb` | `AI_SUMMARIZE` | |
| 10 | `unstructured/ai-parse-invoices/notebook.ipynb` | `AI_PARSE_DOCUMENT` | Upload PDFs to stage first |
| 11 | `unstructured/ai-redact-pii/notebook.ipynb` | `AI_REDACT` | |
| 12 | `unstructured/cortex-search-rag/notebook.ipynb` | Cortex Search + RAG | Run lab 9 first |
| 13 | `unstructured/cortex-agent-orchestrator/notebook.ipynb` | Cortex Agent | Run labs 4, 9, 12 first |

### Notes on specific labs

- **Lab 4 (Cortex Analyst)** — uses a `sales_semantic_model.yaml` file that must be staged. The notebook includes the PUT command.
- **Lab 10 (AI_PARSE_DOCUMENT)** — requires PDF files on the `@invoice_pdfs` stage. Upload via Snowsight or PUT.
- **Lab 12 (Cortex Search)** — creates a `CORTEX SEARCH SERVICE` on warehouse `COMPUTE_WH`. Edit the notebook if your warehouse name differs.
- **Lab 13 (Cortex Agent)** — documents the REST API spec for calling the agent from any HTTP client.

---

## Lab Index

### Structured Data

| Lab | Feature | Dataset |
|---|---|---|
| [ai-classify-orders](structured/ai-classify-orders/) | `AI_CLASSIFY` | TPC-H ORDERS (zero-ingestion) |
| [ai-sentiment-reviews](structured/ai-sentiment-reviews/) | `AI_SENTIMENT` | 30 synthetic product reviews |
| [ai-agg-sales](structured/ai-agg-sales/) | `AI_AGG` | TPC-H LINEITEM (zero-ingestion) |
| [cortex-analyst-sales](structured/cortex-analyst-sales/) | Cortex Analyst | TPC-H views + semantic model YAML |

### Semi-Structured Data

| Lab | Feature | Dataset |
|---|---|---|
| [ai-extract-logs](semi-structured/ai-extract-logs/) | `AI_EXTRACT` | 200 JSON web server logs |
| [ai-filter-feedback](semi-structured/ai-filter-feedback/) | `AI_FILTER` | 20 VARIANT feedback records |
| [ai-translate-catalog](semi-structured/ai-translate-catalog/) | `AI_TRANSLATE` | 16 multilingual product descriptions |
| [cortex-complete-general](semi-structured/cortex-complete-general/) | `CORTEX.COMPLETE` | 5 prompt engineering patterns |

### Unstructured Data

| Lab | Feature | Dataset |
|---|---|---|
| [ai-summarize-articles](unstructured/ai-summarize-articles/) | `AI_SUMMARIZE` | 5 Wikipedia-style articles |
| [ai-parse-invoices](unstructured/ai-parse-invoices/) | `AI_PARSE_DOCUMENT` | PDF invoices on stage |
| [ai-redact-pii](unstructured/ai-redact-pii/) | `AI_REDACT` | 10 synthetic PII records |
| [cortex-search-rag](unstructured/cortex-search-rag/) | Cortex Search + RAG | Article embeddings + search service |
| [cortex-agent-orchestrator](unstructured/cortex-agent-orchestrator/) | Cortex Agent | Multi-tool orchestration |

---

## Teardown

Remove all objects created by the labs:

```sql
DROP DATABASE IF EXISTS GENAI_LEARNING;
```

Delete the workspace: **Snowsight** → **Projects** → **Workspaces** → `genai-labs` → **Delete**
