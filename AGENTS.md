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
| 01 Complete Basics | `COMPLETE` | Prompt experiments |
| 02 Complete Advanced | `TRY_COMPLETE`, `COUNT_TOKENS`, `SPLIT_TEXT` | Mixed |
| 03 Embeddings & Vectors | `EMBED_TEXT_768/1024`, all 4 vector distances | Embedding store |

### Part 2: AI Functions (Labs 04–08) — Paired complementary functions
| Lab | Functions | Data |
|---|---|---|
| 04 Classify + Sentiment | `AI_CLASSIFY` + `AI_SENTIMENT` | TPC-H ORDERS + 9 reviews |
| 05 Extract + Filter | `AI_EXTRACT` + `AI_FILTER` | 6 logs + 8 feedback records |
| 06 Summarize + Translate | `AI_SUMMARIZE` + `AI_TRANSLATE` | 3 articles + 7 catalog entries |
| 07 Redact + Parse | `AI_REDACT` + `AI_PARSE_DOCUMENT` | 5 PII records + staged PDFs |
| 08 Agg + Extract Answer | `AI_AGG` + `EXTRACT_ANSWER` | TPC-H LINEITEM + 3 QA docs |

### Part 3: Search & RAG (Labs 09–10)
| Lab | Functions | Data |
|---|---|---|
| 09 Cortex Search | Cortex Search Service DDL | wiki_articles |
| 10 RAG Pattern | Embed → Search → Complete | rag_knowledge_base |

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
| 17 Cost Monitoring | `ACCOUNT_USAGE` views, `COUNT_TOKENS` | Usage history |
| 18 Observability | Event Tables, LLM-as-Judge | Evaluation samples |

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
