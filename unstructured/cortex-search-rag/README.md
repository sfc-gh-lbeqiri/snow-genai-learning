# AI_EMBED + Cortex Search — Semantic Search and RAG

**Data modality:** Unstructured (text documents)
**Feature:** AI_EMBED (EMBED_TEXT_1024), Cortex Search Service, CORTEX.COMPLETE (RAG)
**Dataset:** Wiki articles from Phase 3a (reused — no new data)

## What this example teaches

Three progressive approaches: manual vector search with embeddings → managed Cortex Search Service → full RAG pipeline combining search with LLM generation.

## Prerequisites

Run Phase 3a first:
```bash
snow sql -f ../ai-summarize-articles/setup.sql
```

## Run instructions

```bash
snow sql -f ../../shared/utils.sql  # once
snow sql -f setup.sql               # creates embeddings + Cortex Search Service
export SNOWFLAKE_CONNECTION_NAME=<your_connection>
jupyter nbconvert --to notebook --execute notebook.ipynb --inplace
```

## Note on Cortex Search Service

The `CREATE CORTEX SEARCH SERVICE` in `setup.sql` references `COMPUTE_WH`. Update the warehouse name to match your account if needed.
