# AI_FILTER — Surfacing Actionable Customer Feedback

**Data modality:** Semi-Structured (VARIANT/JSON)
**Feature:** AI_FILTER
**Dataset:** Synthetic customer feedback JSON (generated inline)

## What this example teaches

How to use `AI_FILTER` as a semantic `WHERE` clause to surface only actionable feedback items from a mixed dataset, then chain with `AI_CLASSIFY` for routing.

## Run instructions

```bash
snow sql -f ../../shared/utils.sql  # once
snow sql -f setup.sql
export SNOWFLAKE_CONNECTION_NAME=<your_connection>
jupyter nbconvert --to notebook --execute notebook.ipynb --inplace
```
