# AGENTS.md — Snowflake GenAI Learning Project

## Purpose

This repo is a **practical learning resource for a Snowflake Solutions Architect**. Every example must:
1. Be self-contained and runnable end-to-end with minimal setup
2. Include data — either generated inline or loaded from a publicly available open-source dataset
3. Teach a specific Snowflake GenAI capability through hands-on code and clear explanations
4. Cover all three data modalities: structured, semi-structured, and unstructured

---

## Audience

**Snowflake Solutions Architect** — technically proficient but learning these specific GenAI features for the first time. Examples should explain *why* each feature is used, not just *how*.

---

## Repository Structure

```
snow-genai-learning/
├── AGENTS.md
├── requirements.md
├── structured/
│   └── <use-case-name>/
│       ├── setup.sql         # DDL + data generation/load (must run first)
│       ├── notebook.ipynb    # End-to-end walkthrough with narrative
│       └── README.md         # Use case summary, dataset source, run instructions
├── semi-structured/
│   └── <use-case-name>/
│       ├── setup.sql
│       ├── notebook.ipynb
│       └── README.md
├── unstructured/
│   └── <use-case-name>/
│       ├── setup.sql
│       ├── notebook.ipynb
│       └── README.md
└── shared/
    └── utils.sql             # Reusable SQL helpers
```

Name use-case directories in lowercase with hyphens, e.g. `cortex-analyst-sales`, `document-qa-rag`.

---

## Data Strategy (priority order)

1. **`SNOWFLAKE_SAMPLE_DATA`** — use first; zero ingestion overhead (TPC-H, TPC-DS, Weather)
2. **Publicly available open-source datasets** — Hugging Face, NYC Open Data, Wikipedia dumps, UCI ML Repository
3. **Synthetic data generated inline** — use `SELECT ... FROM TABLE(GENERATOR(...))` in SQL or Python `faker` if no public dataset fits

Always document the dataset source and how to obtain it in `README.md`.

---

## GenAI Capabilities to Cover

| Feature | Data Modality | Suggested Dataset |
|---|---|---|
| `SNOWFLAKE.CORTEX.COMPLETE` | Any | Any text column |
| `AI_CLASSIFY` | Structured / Semi | TPC-H orders, product catalog JSON |
| `AI_SENTIMENT` | Structured | Amazon reviews (Hugging Face) |
| `AI_EXTRACT` | Semi / Unstructured | JSON logs, PDF contracts |
| `AI_SUMMARIZE` | Unstructured | Wikipedia articles, support tickets |
| `AI_TRANSLATE` | Any | Multilingual product descriptions |
| `AI_EMBED` + vector search | Any | Any text corpus |
| `AI_FILTER` | Any | Customer feedback table |
| `AI_AGG` | Structured | TPC-H / TPC-DS |
| `AI_PARSE_DOCUMENT` | Unstructured | PDF invoices, images |
| `AI_REDACT` | Any | Synthetic PII dataset |
| Cortex Analyst | Structured | TPC-H ORDERS + LINEITEM |
| Cortex Search | Unstructured / Semi | Wikipedia / product manuals |
| Cortex Agent | Any | Multi-tool orchestration demo |

---

## Per-Example Requirements

Each example directory must satisfy:
- [ ] `setup.sql` runs cleanly from scratch — creates DB/schema/stage/table, loads or generates data
- [ ] `notebook.ipynb` is self-contained — runs top-to-bottom without manual steps
- [ ] Every code cell is preceded by a **markdown cell** explaining what it does and why
- [ ] `README.md` states: use case description, dataset source + link, prerequisites, run steps
- [ ] No hardcoded credentials or account identifiers
- [ ] Uses `SNOWFLAKE_CONNECTION_NAME` env variable for all connections

---

## Notebook Structure (learning-first)

Notebooks must follow this narrative structure:
1. **Use Case Overview** (markdown) — what problem this solves, why it matters for a SA
2. **Setup & Imports** — connect to Snowflake, verify data is loaded
3. **Data Exploration** — preview the data, understand its shape
4. **Feature Demo** — demonstrate the GenAI capability with progressive examples (simple → complex)
5. **Interpretation** — explain the output, discuss model/parameter choices
6. **Cleanup** (optional) — drop temp objects if created

---

## Snowflake Connection Pattern

```python
import os
import snowflake.connector

conn = snowflake.connector.connect(
    connection_name=os.getenv("SNOWFLAKE_CONNECTION_NAME") or "<active_connection>"
)
```

Always run with: `SNOWFLAKE_CONNECTION_NAME=<name> jupyter nbconvert --to notebook --execute notebook.ipynb`

---

## Coding Conventions

- SQL: uppercase keywords, `snake_case` identifiers
- Python: PEP8; no inline comments — use markdown cells in notebooks for explanations
- Never hardcode secrets, credentials, or account URLs
- Prefer `SNOWFLAKE_SAMPLE_DATA` objects over external downloads where possible

---

## Agent Instructions

### Before starting any example
1. Check `SNOWFLAKE_SAMPLE_DATA` for a suitable dataset first
2. Use `snowflake_product_docs` to verify the current API signature for the GenAI function being used — do not rely on prior knowledge
3. Validate all SQL with `only_compile=true` before executing

### Skill routing (mandatory)
- Building a **semantic view** for Cortex Analyst → invoke `semantic-view` skill
- Building a **Cortex Search service** → invoke `search-optimization` skill
- Building a **Cortex Agent** → invoke `cortex-agent` skill
- Building a **Streamlit demo app** → invoke `developing-with-streamlit` skill
- Using **AI_CLASSIFY, AI_EXTRACT, AI_SUMMARIZE, etc.** → invoke `cortex-ai-functions` skill

### Quality bar
- Every example must be verifiable: run `setup.sql` then execute the notebook top-to-bottom without errors
- If a dataset requires download, the `README.md` must include the exact download command or URL
- Notebooks should be understandable by someone who has never used the specific feature before
