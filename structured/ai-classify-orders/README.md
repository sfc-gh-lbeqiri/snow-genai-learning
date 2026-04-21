# AI_CLASSIFY — Order Comment Classification

**Data modality:** Structured
**Feature:** AI_CLASSIFY
**Dataset:** TPC-H ORDERS from `SNOWFLAKE_SAMPLE_DATA` (zero ingestion)

## What this example teaches

How to use `AI_CLASSIFY` to automatically tag free-text columns into predefined business categories using an LLM — no regex, no model training.

## Run instructions

```bash
snow sql -f ../../shared/utils.sql  # once
snow sql -f setup.sql
export SNOWFLAKE_CONNECTION_NAME=<your_connection>
jupyter nbconvert --to notebook --execute notebook.ipynb --inplace
```

## Dataset

`SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS.O_COMMENT` — available in all Snowflake accounts.
