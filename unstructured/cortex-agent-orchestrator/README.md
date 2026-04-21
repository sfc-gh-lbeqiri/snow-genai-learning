# Cortex Agent — Multi-Tool Orchestration

**Data modality:** All (structured + unstructured)
**Feature:** Cortex Agent
**Reuses:** All prior phases (sales_semantic_model, wiki_articles, WIKI_SEARCH service)

## What this example teaches

How to build a Cortex Agent that orchestrates multiple tools — Cortex Analyst for structured SQL Q&A and Cortex Search for knowledge retrieval — in a single conversational interface.

## Prerequisites

All prior phases must be set up:
```bash
snow sql -f ../../shared/utils.sql
snow sql -f ../../structured/cortex-analyst-sales/setup.sql
snow sql -f ../../unstructured/ai-summarize-articles/setup.sql
snow sql -f ../../unstructured/cortex-search-rag/setup.sql
```
Also ensure the semantic model YAML is staged (see `cortex-analyst-sales` notebook, Step 2).

## Run instructions

```bash
snow sql -f setup.sql
export SNOWFLAKE_CONNECTION_NAME=<your_connection>
jupyter nbconvert --to notebook --execute notebook.ipynb --inplace
```
