# Snowflake GenAI Learning

A practical, hands-on learning repository for Snowflake Solutions Architects to explore Snowflake's GenAI capabilities across structured, semi-structured, and unstructured data.

---

## Prerequisites

| Requirement | Details |
|---|---|
| Snowflake account | Cortex AI features enabled (Business Critical+, or enabled on request) |
| Warehouse | Any active warehouse (XSmall is sufficient for most labs) |

---

## Deployment — Snowflake Workspace (Recommended)

Deploy and run all labs directly inside Snowsight with zero local setup.

### Step 1 — Create a Snowflake workspace

1. Open **Snowsight** → **Projects** → **Workspaces**
2. Click **+ Workspace** → select **Create from Git Repository**
3. Repository URL: `https://github.com/sfc-gh-lbeqiri/snow-genai-learning.git`
4. Workspace name: **`genai-labs`**
5. Click **Create**

The workspace clones the repo and provides an integrated terminal, file browser, and notebook runner.

### Step 2 — Create the shared database

Open the workspace terminal and run:

```sql
CREATE DATABASE IF NOT EXISTS GENAI_LEARNING;
CREATE SCHEMA IF NOT EXISTS GENAI_LEARNING.PUBLIC;
```

Or via the terminal:

```bash
snow sql --query "CREATE DATABASE IF NOT EXISTS GENAI_LEARNING; CREATE SCHEMA IF NOT EXISTS GENAI_LEARNING.PUBLIC;"
```

### Step 3 — Deploy a lab

Each lab is self-contained. From the workspace terminal:

```bash
snow sql -f <lab_path>/setup.sql
```

Then open `<lab_path>/notebook.ipynb` in the workspace notebook runner and execute cells interactively.

**Example — deploy the AI_CLASSIFY lab:**

```bash
snow sql -f structured/ai-classify-orders/setup.sql
```

Then open `structured/ai-classify-orders/notebook.ipynb` and run all cells.

### Step 4 — Deploy all labs in sequence

Run from the workspace terminal:

```bash
# Shared database
snow sql --query "CREATE DATABASE IF NOT EXISTS GENAI_LEARNING; CREATE SCHEMA IF NOT EXISTS GENAI_LEARNING.PUBLIC;"

# Phase 1 — Structured
snow sql -f structured/cortex-analyst-sales/setup.sql
snow sql -f structured/ai-classify-orders/setup.sql
snow sql -f structured/ai-sentiment-reviews/setup.sql
snow sql -f structured/ai-agg-sales/setup.sql

# Phase 2 — Semi-Structured
snow sql -f semi-structured/ai-extract-logs/setup.sql
snow sql -f semi-structured/ai-filter-feedback/setup.sql
snow sql -f semi-structured/ai-translate-catalog/setup.sql
snow sql -f semi-structured/cortex-complete-general/setup.sql

# Phase 3 — Unstructured
snow sql -f unstructured/ai-summarize-articles/setup.sql
snow sql -f unstructured/ai-parse-invoices/setup.sql
snow sql -f unstructured/ai-redact-pii/setup.sql
snow sql -f unstructured/cortex-search-rag/setup.sql

# Phase 4 — Advanced (depends on all prior phases)
snow sql -f unstructured/cortex-agent-orchestrator/setup.sql
```

### Special setup notes

**AI_PARSE_DOCUMENT lab** — requires generating sample PDFs first:

```bash
cd unstructured/ai-parse-invoices
pip install fpdf2
python generate_invoices.py
```

**Cortex Search RAG lab** — the `setup.sql` creates a `CORTEX SEARCH SERVICE`. Update the warehouse name in `setup.sql` if yours differs from `COMPUTE_WH`.

**Cortex Analyst lab** — after running `setup.sql`, open the notebook and run **Step 2** (the `PUT` cell) to upload the semantic model YAML to the stage before querying.

---

## Deployment — Local (Alternative)

Run labs from your local machine using Jupyter.

### Prerequisites (local only)

| Requirement | Details |
|---|---|
| Python | 3.9+ |
| Snowflake CLI | `snow` CLI with a named connection — [install guide](https://docs.snowflake.com/en/developer-guide/snowflake-cli/installation/installation) |

```bash
pip install snowflake-connector-python snowflake-core jupyter pandas matplotlib fpdf2
```

### Step 1 — Clone the repo

```bash
git clone https://github.com/sfc-gh-lbeqiri/snow-genai-learning.git
cd snow-genai-learning
```

### Step 2 — Configure your connection

```bash
snow connection add          # follow prompts if needed
snow connection test --connection <your_connection_name>
export SNOWFLAKE_CONNECTION_NAME=<your_connection_name>
```

### Step 3 — Create the shared database

```bash
snow sql --query "CREATE DATABASE IF NOT EXISTS GENAI_LEARNING; CREATE SCHEMA IF NOT EXISTS GENAI_LEARNING.PUBLIC;" --connection $SNOWFLAKE_CONNECTION_NAME
```

### Step 4 — Deploy a lab

```bash
snow sql -f <lab_path>/setup.sql --connection $SNOWFLAKE_CONNECTION_NAME
jupyter notebook <lab_path>/notebook.ipynb
```

All notebooks auto-detect the connection: they use `SNOWFLAKE_CONNECTION_NAME` env variable if set, or fall back to the default `genai-labs` connection name.

---

## Lab Index

### Structured Data

| Lab | Feature | Dataset | Dependencies |
|---|---|---|---|
| [cortex-analyst-sales](structured/cortex-analyst-sales/) | Cortex Analyst | TPC-H (SNOWFLAKE_SAMPLE_DATA) | none |
| [ai-classify-orders](structured/ai-classify-orders/) | AI_CLASSIFY | TPC-H ORDERS | none |
| [ai-sentiment-reviews](structured/ai-sentiment-reviews/) | AI_SENTIMENT | Synthetic reviews | none |
| [ai-agg-sales](structured/ai-agg-sales/) | AI_AGG | TPC-H LINEITEM | none |

### Semi-Structured Data

| Lab | Feature | Dataset | Dependencies |
|---|---|---|---|
| [ai-extract-logs](semi-structured/ai-extract-logs/) | AI_EXTRACT | Synthetic JSON logs | none |
| [ai-filter-feedback](semi-structured/ai-filter-feedback/) | AI_FILTER | Synthetic feedback | none |
| [ai-translate-catalog](semi-structured/ai-translate-catalog/) | AI_TRANSLATE | Synthetic multilingual catalog | none |
| [cortex-complete-general](semi-structured/cortex-complete-general/) | CORTEX.COMPLETE | Reuses Phase 1 tables | ai-sentiment-reviews, ai-classify-orders |

### Unstructured Data

| Lab | Feature | Dataset | Dependencies |
|---|---|---|---|
| [ai-summarize-articles](unstructured/ai-summarize-articles/) | AI_SUMMARIZE | Synthetic Wikipedia articles | none |
| [ai-parse-invoices](unstructured/ai-parse-invoices/) | AI_PARSE_DOCUMENT | Generated PDFs | `python generate_invoices.py` |
| [ai-redact-pii](unstructured/ai-redact-pii/) | AI_REDACT | Synthetic PII records | none |
| [cortex-search-rag](unstructured/cortex-search-rag/) | AI_EMBED + Cortex Search | Wiki articles | ai-summarize-articles |

### Advanced Orchestration

| Lab | Feature | Dependencies |
|---|---|---|
| [cortex-agent-orchestrator](unstructured/cortex-agent-orchestrator/) | Cortex Agent | cortex-analyst-sales, ai-summarize-articles, cortex-search-rag |

---

## Teardown

Remove all Snowflake objects created by the labs:

```sql
DROP DATABASE IF EXISTS GENAI_LEARNING;
```

Or from a terminal:

```bash
snow sql --query "DROP DATABASE IF EXISTS GENAI_LEARNING"
```

To delete the workspace, go to **Snowsight** → **Projects** → **Workspaces** → select `genai-labs` → **Delete**.
