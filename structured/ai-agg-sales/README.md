# AI_AGG — LLM-Powered Text Aggregation

**Data modality:** Structured
**Feature:** AI_AGG
**Dataset:** TPC-H LINEITEM from `SNOWFLAKE_SAMPLE_DATA` (zero ingestion)

## What this example teaches

How to use `AI_AGG` to synthesise narrative summaries across thousands of text rows, grouped by business dimensions — like `SUM()` but for natural language.

## Run instructions

```bash
snow sql -f ../../shared/utils.sql  # once
snow sql -f setup.sql
export SNOWFLAKE_CONNECTION_NAME=<your_connection>
jupyter nbconvert --to notebook --execute notebook.ipynb --inplace
```

## Dataset

`SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.LINEITEM` — available in all Snowflake accounts. No download needed.
