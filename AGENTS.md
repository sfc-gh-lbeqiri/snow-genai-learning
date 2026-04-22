# AGENTS.md — Snowflake GenAI Learning Project

## Purpose

Practical learning resource for Snowflake Solutions Architects aligned with the **SnowPro Specialty: Generative AI** exam. Every lab is a **self-contained SQL Snowflake Notebook** (`.ipynb` with Streamlit kernelspec) that includes setup, sample data, and demos in a single file.

---

## Audience

**Snowflake Solutions Architect** — technically proficient but learning GenAI features for the first time. Examples explain *why* each feature is used, not just *how*.

---

## Repository Structure

```
snow-genai-learning/
├── AGENTS.md
├── README.md
├── 01-foundations/
│   ├── 01-complete-basics/notebook.ipynb
│   ├── 02-complete-advanced/notebook.ipynb
│   └── 03-embeddings-vectors/notebook.ipynb
├── 02-ai-functions/
│   ├── 04-classify-sentiment/notebook.ipynb
│   ├── 05-extract-filter/notebook.ipynb
│   ├── 06-summarize-translate/notebook.ipynb
│   ├── 07-redact-parse/notebook.ipynb
│   └── 08-agg-extract-answer/notebook.ipynb
├── 03-search-and-rag/
│   ├── 09-cortex-search/notebook.ipynb
│   └── 10-rag-pattern/notebook.ipynb
├── 04-analyst-and-agents/
│   ├── 11-cortex-analyst/notebook.ipynb
│   ├── 11-cortex-analyst/sales_semantic_model.yaml
│   └── 12-cortex-agent/notebook.ipynb
├── 05-production/
│   ├── 13-finetuning/notebook.ipynb
│   ├── 14-pipelines/notebook.ipynb
│   └── 15-guard-safety/notebook.ipynb
└── 06-governance/
    ├── 16-access-controls/notebook.ipynb
    ├── 17-cost-monitoring/notebook.ipynb
    └── 18-observability/notebook.ipynb
```

Each notebook contains:
- Markdown cells with explanations and reference tables
- SQL cells that create the database, tables, insert data, and run demos
- No external setup scripts, no Python dependencies

---

## Data Strategy

1. **`SNOWFLAKE_SAMPLE_DATA`** — zero ingestion overhead (TPC-H)
2. **Synthetic data generated inline** — `INSERT INTO ... VALUES` or `GENERATOR()` in SQL
3. Every dataset is created inside the notebook — no external downloads required

---

## 18 Labs — Organized by Learning Journey

### Part 1: Foundations (Labs 01–03)
| Lab | Functions | Data |
|---|---|---|
| 01 Complete Basics | `AI_COMPLETE` | Prompt experiments |
| 02 Complete Advanced | `AI_COMPLETE`, `AI_COUNT_TOKENS`, `TRY_COMPLETE`¹, `SPLIT_TEXT`¹ | Mixed |
| 03 Embeddings & Vectors | `AI_EMBED`, all 4 vector distances | Embedding store |

### Part 2: AI Functions (Labs 04–08) — Paired complementary functions
| Lab | Functions | Data |
|---|---|---|
| 04 Classify + Sentiment | `AI_CLASSIFY` + `AI_SENTIMENT` | TPC-H ORDERS + 9 reviews |
| 05 Extract + Filter | `AI_EXTRACT` + `AI_FILTER` | 6 logs + 8 feedback records |
| 06 Summarize + Translate | `AI_SUMMARIZE_AGG` + `AI_TRANSLATE` | 3 articles + 7 catalog entries |
| 07 Redact + Parse | `AI_REDACT` + `AI_PARSE_DOCUMENT` | 5 PII records + staged PDFs |
| 08 Agg + Extract Answer | `AI_AGG` + `EXTRACT_ANSWER`¹ | TPC-H LINEITEM + 3 QA docs |

### Part 3: Search & RAG (Labs 09–10)
| Lab | Functions | Data |
|---|---|---|
| 09 Cortex Search | Cortex Search Service DDL | wiki_articles |
| 10 RAG Pattern | `AI_EMBED` → Search → `AI_COMPLETE` | rag_knowledge_base |

### Part 4: Analyst & Agents (Labs 11–12)
| Lab | Functions | Data |
|---|---|---|
| 11 Cortex Analyst | Semantic Model YAML, VQR, Semantic Views | TPC-H views |
| 12 Cortex Agent | REST API, multi-tool orchestration | Search + Analyst |

### Part 5: Production (Labs 13–15)
| Lab | Functions | Data |
|---|---|---|
| 13 Fine-Tuning | `FINETUNE('CREATE')` | 5 training examples |
| 14 Pipelines | Dynamic Tables + Streams + Tasks | Support tickets |
| 15 Guard & Safety | Cortex Guard (`guardrails: true`) | Prompt patterns |

### Part 6: Governance (Labs 16–18)
| Lab | Functions | Data |
|---|---|---|
| 16 Access Controls | `CORTEX_MODELS_ALLOWLIST`, cross-region | Account params |
| 17 Cost Monitoring | `ACCOUNT_USAGE` views, `AI_COUNT_TOKENS` | Usage history |
| 18 Observability | Event Tables, LLM-as-Judge | Evaluation samples |

¹ No `AI_` prefixed equivalent yet — remains under `SNOWFLAKE.CORTEX` namespace.

---

## SQL Function Naming

All labs use the preferred **`AI_` prefixed SQL functions** as primary (e.g. `AI_COMPLETE`, `AI_EMBED`, `AI_CLASSIFY`). Each notebook includes a note cell mapping to the legacy `SNOWFLAKE.CORTEX.*` equivalents.

| AI_ Function | Legacy Equivalent |
|---|---|
| `AI_COMPLETE` | `SNOWFLAKE.CORTEX.COMPLETE` |
| `AI_EMBED` | `SNOWFLAKE.CORTEX.EMBED_TEXT_768` / `EMBED_TEXT_1024` |
| `AI_CLASSIFY` | `SNOWFLAKE.CORTEX.CLASSIFY_TEXT` |
| `AI_SENTIMENT` | `SNOWFLAKE.CORTEX.SENTIMENT` / `ENTITY_SENTIMENT` |
| `AI_TRANSLATE` | `SNOWFLAKE.CORTEX.TRANSLATE` |
| `AI_SUMMARIZE_AGG` | `SNOWFLAKE.CORTEX.SUMMARIZE` |
| `AI_COUNT_TOKENS` | `SNOWFLAKE.CORTEX.COUNT_TOKENS` |
| `AI_REDACT` | *(new — no legacy equivalent)* |
| `AI_EXTRACT` | *(new — no legacy equivalent)* |
| `AI_FILTER` | *(new — no legacy equivalent)* |
| `AI_AGG` | *(new — no legacy equivalent)* |
| `AI_SIMILARITY` | *(new — no legacy equivalent)* |
| `AI_PARSE_DOCUMENT` | `SNOWFLAKE.CORTEX.PARSE_DOCUMENT` |

Functions with **no `AI_` equivalent yet**: `TRY_COMPLETE`, `EXTRACT_ANSWER`, `SPLIT_TEXT_RECURSIVE_CHARACTER`, `FINETUNE`.

---

## Notebook Format

All notebooks use the Snowflake-native format:
- Kernelspec: `"display_name": "Streamlit Notebook", "name": "streamlit"`
- Code cells: `"metadata": {"language": "sql", "name": "cell_name"}`
- Markdown cells: `"metadata": {"name": "cell_name", "collapsed": false}`

### Narrative structure
1. **Use Case Overview** — what problem this solves, key metadata table
2. **Environment Setup** — `CREATE DATABASE`, `CREATE TABLE`, `INSERT` data
3. **Data Exploration** — preview the data
4. **Feature Demo** — progressive examples (simple → complex)
5. **Key Takeaways** — summary and SA tips

---

## Deployment

Import notebooks into **Snowsight** → **Projects** → **Notebooks** (from repository or individual .ipynb import). Run directly in Snowsight — no workspace or local tooling needed.

---

## Coding Conventions

- SQL: uppercase keywords, `snake_case` identifiers
- No inline code comments — use markdown cells for explanations
- No hardcoded secrets, credentials, or account URLs
- All objects created in `GENAI_LEARNING.PUBLIC`

---

## Agent Instructions

### Snowflake documentation lookup
When referencing Snowflake official documentation, prefer the agent-friendly Markdown versions by appending `.md` to the URL. These are smaller, strip navigation/scripts, and are optimised for LLM context.

- **Markdown page:** append `.md` to any docs URL, e.g. `https://docs.snowflake.com/sql-reference/sql/create-table.md`
- **Section indexes:** `https://docs.snowflake.com/llms.txt` links to per-section `llms.txt` files (e.g. `sql-reference/sql/llms.txt`). Fetch only the sections you need to reduce token usage.

See [release note](https://docs.snowflake.com/en/release-notes/2026/other/2026-04-15-agent-friendly-docs) for details.

### Refreshing the available model list

To get the current list of Cortex LLM models available in the account:

```sql
CALL SNOWFLAKE.MODELS.CORTEX_BASE_MODELS_REFRESH();
SHOW MODELS IN SNOWFLAKE.MODELS;
```

Run this as `ACCOUNTADMIN`. The refresh populates `SNOWFLAKE.MODELS` with all currently available Cortex base models.

### Before starting any example
1. Check `SNOWFLAKE_SAMPLE_DATA` for suitable datasets first
2. Use `snowflake_product_docs` or the `.md` doc URLs above to verify current API signatures
3. Validate SQL with `only_compile=true` before executing

### Skill routing (mandatory)
- Semantic view for Cortex Analyst → `semantic-view` skill
- Cortex Search service → `search-optimization` skill
- Cortex Agent → `cortex-agent` skill
- AI_CLASSIFY, AI_EXTRACT, AI_SUMMARIZE_AGG, etc. → `cortex-ai-functions` skill

### Quality bar
- Every notebook must run top-to-bottom without errors in a Snowflake Workspace
- Notebooks should be understandable by someone who has never used the feature before
