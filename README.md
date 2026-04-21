# Snowflake GenAI Learning

A hands-on learning repository for Snowflake Solutions Architects covering 13 Cortex AI features across structured, semi-structured, and unstructured data.

Every lab is a **self-contained Snowflake SQL Notebook** — setup, sample data, and demos are all in a single `.ipynb` file. No external scripts, no Python dependencies.

---

## Prerequisites

| Requirement | Details |
|---|---|
| Snowflake account | Cortex AI features enabled |
| Warehouse | Any active warehouse (XSmall is sufficient) |

---

## Deployment — Snowflake Workspace

### Step 1 — Create a workspace

1. Open **Snowsight** → **Projects** → **Workspaces**
2. Click **+ Workspace**
3. Name: **`genai-labs`**
4. Click **Create**

### Step 2 — Upload lab files

From the workspace terminal:

```bash
git clone https://github.com/sfc-gh-lbeqiri/snow-genai-learning.git .
```

Or download the repo as a ZIP and drag-and-drop into the workspace file browser.

### Step 3 — Run a lab

Each notebook is fully self-contained. Open any `notebook.ipynb` in the workspace and **run all cells top to bottom**. The first cells create the database, tables, and sample data.

**Example:** Open `structured/ai-classify-orders/notebook.ipynb` → Run All

### Recommended order

Run labs in this sequence (later labs may depend on earlier ones):

| Phase | Lab | Notes |
|---|---|---|
| 1 | `structured/ai-classify-orders/notebook.ipynb` | |
| 2 | `structured/ai-sentiment-reviews/notebook.ipynb` | |
| 3 | `structured/ai-agg-sales/notebook.ipynb` | |
| 4 | `structured/cortex-analyst-sales/notebook.ipynb` | Stages a YAML semantic model |
| 5 | `semi-structured/ai-extract-logs/notebook.ipynb` | |
| 6 | `semi-structured/ai-filter-feedback/notebook.ipynb` | |
| 7 | `semi-structured/ai-translate-catalog/notebook.ipynb` | |
| 8 | `semi-structured/cortex-complete-general/notebook.ipynb` | |
| 9 | `unstructured/ai-summarize-articles/notebook.ipynb` | |
| 10 | `unstructured/ai-parse-invoices/notebook.ipynb` | Requires PDFs on stage |
| 11 | `unstructured/ai-redact-pii/notebook.ipynb` | |
| 12 | `unstructured/cortex-search-rag/notebook.ipynb` | Depends on lab 9 |
| 13 | `unstructured/cortex-agent-orchestrator/notebook.ipynb` | Depends on labs 4, 9, 12 |

### Special notes

- **AI_PARSE_DOCUMENT lab (10)** — requires PDF files uploaded to the `@invoice_pdfs` stage. Use the Snowsight **Add Data** wizard or a PUT command.
- **Cortex Search RAG lab (12)** — creates a `CORTEX SEARCH SERVICE` using warehouse `COMPUTE_WH`. Change the warehouse name in the notebook if yours differs.
- **Cortex Agent lab (13)** — demonstrates the REST API specification. Call the agent from any HTTP client.

---

## Lab Index

### Structured Data

| Lab | Feature | Dataset |
|---|---|---|
| [ai-classify-orders](structured/ai-classify-orders/) | `AI_CLASSIFY` | TPC-H ORDERS (zero-ingestion) |
| [ai-sentiment-reviews](structured/ai-sentiment-reviews/) | `AI_SENTIMENT` | 30 synthetic reviews |
| [ai-agg-sales](structured/ai-agg-sales/) | `AI_AGG` | TPC-H LINEITEM (zero-ingestion) |
| [cortex-analyst-sales](structured/cortex-analyst-sales/) | Cortex Analyst | TPC-H views + semantic model |

### Semi-Structured Data

| Lab | Feature | Dataset |
|---|---|---|
| [ai-extract-logs](semi-structured/ai-extract-logs/) | `AI_EXTRACT` | 200 JSON logs |
| [ai-filter-feedback](semi-structured/ai-filter-feedback/) | `AI_FILTER` | 20 VARIANT feedback records |
| [ai-translate-catalog](semi-structured/ai-translate-catalog/) | `AI_TRANSLATE` | 16 multilingual descriptions |
| [cortex-complete-general](semi-structured/cortex-complete-general/) | `CORTEX.COMPLETE` | Prompt patterns |

### Unstructured Data

| Lab | Feature | Dataset |
|---|---|---|
| [ai-summarize-articles](unstructured/ai-summarize-articles/) | `AI_SUMMARIZE` | 5 Wikipedia-style articles |
| [ai-parse-invoices](unstructured/ai-parse-invoices/) | `AI_PARSE_DOCUMENT` | PDF invoices on stage |
| [ai-redact-pii](unstructured/ai-redact-pii/) | `AI_REDACT` | 10 synthetic PII records |
| [cortex-search-rag](unstructured/cortex-search-rag/) | Cortex Search + RAG | Article embeddings |
| [cortex-agent-orchestrator](unstructured/cortex-agent-orchestrator/) | Cortex Agent | Multi-tool orchestration |

---

## Teardown

```sql
DROP DATABASE IF EXISTS GENAI_LEARNING;
```

To delete the workspace: **Snowsight** → **Projects** → **Workspaces** → `genai-labs` → **Delete**.
