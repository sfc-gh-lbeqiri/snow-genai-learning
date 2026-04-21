# CORTEX.COMPLETE — Prompt Engineering Patterns

**Data modality:** Semi-Structured / Any
**Feature:** SNOWFLAKE.CORTEX.COMPLETE
**Dataset:** Reuses tables from Phases 1 and 2 (no new data needed)

## What this example teaches

Five progressive prompt engineering patterns: simple instruction → data-grounded generation → structured JSON output → few-shot classification → multi-model comparison.

## Prerequisites

Run these first (they create the tables used here):
- `structured/ai-sentiment-reviews/setup.sql`
- `structured/ai-classify-orders/setup.sql`

## Run instructions

```bash
snow sql -f ../../shared/utils.sql  # once
snow sql -f setup.sql
export SNOWFLAKE_CONNECTION_NAME=<your_connection>
jupyter nbconvert --to notebook --execute notebook.ipynb --inplace
```
