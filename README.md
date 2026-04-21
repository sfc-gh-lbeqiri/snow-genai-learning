# Snowflake GenAI Learning

A practical, hands-on learning repository for Snowflake Solutions Architects to explore Snowflake's GenAI capabilities across structured, semi-structured, and unstructured data.

---

## Prerequisites

| Requirement | Details |
|---|---|
| Snowflake account | Cortex AI features must be enabled (available on Business Critical and above, or enabled on request) |
| Python | 3.9 or higher |
| Python packages | `snowflake-connector-python`, `snowflake-core`, `jupyter`, `pandas` |
| Snowflake CLI | `snow` CLI configured with a named connection — [install guide](https://docs.snowflake.com/en/developer-guide/snowflake-cli/installation/installation) |
| Warehouse | Any active warehouse (XSmall is sufficient for most labs) |

Install Python dependencies:

```bash
pip install snowflake-connector-python snowflake-core jupyter pandas matplotlib fpdf2
```

---

## Deployment

### Step 1 — Configure your Snowflake connection

If you already have a named connection in `~/.snowflake/config.toml`, skip this step.

```bash
snow connection add
```

Follow the prompts to set account, user, role, and warehouse. Then verify:

```bash
snow connection test --connection <your_connection_name>
```

Set it as your default for this repo:

```bash
export SNOWFLAKE_CONNECTION_NAME=<your_connection_name>
```

---

### Step 2 — Create the shared database (run once)

```bash
snow sql --query "CREATE DATABASE IF NOT EXISTS GENAI_LEARNING; CREATE SCHEMA IF NOT EXISTS GENAI_LEARNING.PUBLIC;" --connection $SNOWFLAKE_CONNECTION_NAME
```

This creates `GENAI_LEARNING` database and `PUBLIC` schema. All labs use this database.

---

### Step 3 — Deploy a lab

Each lab is self-contained. To deploy any lab:

```bash
# 1. Run the setup SQL (creates tables, views, stages, loads data)
snow sql -f <lab_path>/setup.sql --connection $SNOWFLAKE_CONNECTION_NAME

# 2. Execute the notebook end-to-end
jupyter nbconvert --to notebook --execute <lab_path>/notebook.ipynb --inplace
```

**Example — deploy the AI_CLASSIFY lab:**

```bash
snow sql -f structured/ai-classify-orders/setup.sql --connection $SNOWFLAKE_CONNECTION_NAME
jupyter nbconvert --to notebook --execute structured/ai-classify-orders/notebook.ipynb --inplace
```

**Or open interactively in Jupyter:**

```bash
jupyter notebook <lab_path>/notebook.ipynb
```

---

### Step 4 — Deploy all labs in sequence

Run this script to set up all labs in the correct dependency order:

```bash
# Shared database
snow sql --query "CREATE DATABASE IF NOT EXISTS GENAI_LEARNING; CREATE SCHEMA IF NOT EXISTS GENAI_LEARNING.PUBLIC;" --connection $SNOWFLAKE_CONNECTION_NAME

# Phase 1 — Structured
snow sql -f structured/cortex-analyst-sales/setup.sql   --connection $SNOWFLAKE_CONNECTION_NAME
snow sql -f structured/ai-classify-orders/setup.sql     --connection $SNOWFLAKE_CONNECTION_NAME
snow sql -f structured/ai-sentiment-reviews/setup.sql   --connection $SNOWFLAKE_CONNECTION_NAME
snow sql -f structured/ai-agg-sales/setup.sql           --connection $SNOWFLAKE_CONNECTION_NAME

# Phase 2 — Semi-Structured
snow sql -f semi-structured/ai-extract-logs/setup.sql       --connection $SNOWFLAKE_CONNECTION_NAME
snow sql -f semi-structured/ai-filter-feedback/setup.sql    --connection $SNOWFLAKE_CONNECTION_NAME
snow sql -f semi-structured/ai-translate-catalog/setup.sql  --connection $SNOWFLAKE_CONNECTION_NAME
snow sql -f semi-structured/cortex-complete-general/setup.sql --connection $SNOWFLAKE_CONNECTION_NAME

# Phase 3 — Unstructured
snow sql -f unstructured/ai-summarize-articles/setup.sql --connection $SNOWFLAKE_CONNECTION_NAME
snow sql -f unstructured/ai-parse-invoices/setup.sql     --connection $SNOWFLAKE_CONNECTION_NAME
snow sql -f unstructured/ai-redact-pii/setup.sql         --connection $SNOWFLAKE_CONNECTION_NAME
snow sql -f unstructured/cortex-search-rag/setup.sql     --connection $SNOWFLAKE_CONNECTION_NAME

# Phase 4 — Advanced (depends on all prior phases)
snow sql -f unstructured/cortex-agent-orchestrator/setup.sql --connection $SNOWFLAKE_CONNECTION_NAME
```

---

### Special setup: AI_PARSE_DOCUMENT lab

This lab requires generating sample PDFs before running the notebook:

```bash
cd unstructured/ai-parse-invoices
python generate_invoices.py
jupyter notebook notebook.ipynb
```

### Special setup: Cortex Search RAG lab

The `setup.sql` creates a `CORTEX SEARCH SERVICE`. Update the warehouse name in `setup.sql` to match your account if it differs from `COMPUTE_WH` before running.

### Special setup: Cortex Analyst lab

After running `setup.sql`, open the notebook and run **Step 2** (the `PUT` cell) to upload the semantic model YAML to the stage. This must be done before querying the agent.

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

To remove all objects created by this repo:

```bash
snow sql --query "DROP DATABASE IF EXISTS GENAI_LEARNING" --connection $SNOWFLAKE_CONNECTION_NAME
```
