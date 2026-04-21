# AGENTS.md — Snowflake GenAI Learning Project

## Purpose

Practical learning resource for Snowflake Solutions Architects. Every lab is a **self-contained SQL Snowflake Notebook** (`.ipynb` with `language_info: sql`) that includes setup, sample data, and demos in a single file.

---

## Audience

**Snowflake Solutions Architect** — technically proficient but learning GenAI features for the first time. Examples explain *why* each feature is used, not just *how*.

---

## Repository Structure

```
snow-genai-learning/
├── AGENTS.md
├── README.md
├── structured/
│   └── <use-case-name>/
│       └── notebook.ipynb    # Self-contained SQL notebook (setup + demo)
├── semi-structured/
│   └── <use-case-name>/
│       └── notebook.ipynb
└── unstructured/
    └── <use-case-name>/
        └── notebook.ipynb
```

Each notebook contains:
- Markdown cells with explanations and architecture diagrams
- SQL cells that create the database, tables, insert data, and run demos
- No external setup scripts, no Python dependencies

---

## Data Strategy

1. **`SNOWFLAKE_SAMPLE_DATA`** — zero ingestion overhead (TPC-H)
2. **Synthetic data generated inline** — `INSERT INTO ... VALUES` or `GENERATOR()` in SQL
3. Every dataset is created inside the notebook — no external downloads required

---

## GenAI Capabilities Covered (13 labs)

| Feature | Data Modality | Dataset |
|---|---|---|
| `AI_CLASSIFY` | Structured | TPC-H ORDERS |
| `AI_SENTIMENT` | Structured | 30 synthetic reviews |
| `AI_AGG` | Structured | TPC-H LINEITEM |
| Cortex Analyst | Structured | TPC-H views + semantic model |
| `AI_EXTRACT` | Semi-Structured | 200 JSON logs |
| `AI_FILTER` | Semi-Structured | 20 VARIANT feedback records |
| `AI_TRANSLATE` | Semi-Structured | 16 multilingual descriptions |
| `CORTEX.COMPLETE` | Semi-Structured | Prompt patterns |
| `AI_SUMMARIZE` | Unstructured | 5 Wikipedia-style articles |
| `AI_PARSE_DOCUMENT` | Unstructured | PDF invoices on stage |
| `AI_REDACT` | Unstructured | 10 synthetic PII records |
| Cortex Search + RAG | Unstructured | Article embeddings |
| Cortex Agent | Unstructured | Multi-tool orchestration |

---

## Notebook Format

All notebooks are Snowflake SQL notebooks:
- File format: `.ipynb` with `"language_info": {"name": "sql"}`
- Code cells contain SQL (executed by Snowflake)
- Markdown cells contain explanations

### Narrative structure
1. **Use Case Overview** — what problem this solves, key metadata table
2. **Environment Setup** — `CREATE DATABASE`, `CREATE TABLE`, `INSERT` data
3. **Data Exploration** — preview the data
4. **Feature Demo** — progressive examples (simple → complex)
5. **Key Takeaways** — summary and SA tips

---

## Deployment

**Snowflake Workspace** named `genai-labs`. Clone the repo into the workspace, then open and run notebooks directly in Snowsight.

---

## Coding Conventions

- SQL: uppercase keywords, `snake_case` identifiers
- No inline code comments — use markdown cells for explanations
- No hardcoded secrets, credentials, or account URLs
- All objects created in `GENAI_LEARNING.PUBLIC`

---

## Agent Instructions

### Before starting any example
1. Check `SNOWFLAKE_SAMPLE_DATA` for suitable datasets first
2. Use `snowflake_product_docs` to verify current API signatures
3. Validate SQL with `only_compile=true` before executing

### Skill routing (mandatory)
- Semantic view for Cortex Analyst → `semantic-view` skill
- Cortex Search service → `search-optimization` skill
- Cortex Agent → `cortex-agent` skill
- AI_CLASSIFY, AI_EXTRACT, AI_SUMMARIZE, etc. → `cortex-ai-functions` skill

### Quality bar
- Every notebook must run top-to-bottom without errors in a Snowflake Workspace
- Notebooks should be understandable by someone who has never used the feature before
