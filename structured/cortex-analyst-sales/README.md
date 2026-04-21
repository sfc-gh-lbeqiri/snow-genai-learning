# Cortex Analyst — Sales Q&A

**Data modality:** Structured
**Feature:** Cortex Analyst (text-to-SQL with semantic model)
**Dataset:** TPC-H SF1 from `SNOWFLAKE_SAMPLE_DATA` (zero ingestion)

## What this example teaches

How to build a natural language Q&A interface over structured sales data using Cortex Analyst and a semantic model YAML.

## Run instructions

```bash
# 1. Create the database (once)
snow sql -f ../../shared/utils.sql

# 2. Create views and stage
snow sql -f setup.sql

# 3. Execute notebook
export SNOWFLAKE_CONNECTION_NAME=<your_connection>
jupyter nbconvert --to notebook --execute notebook.ipynb --inplace
```

## Files

| File | Purpose |
|---|---|
| `setup.sql` | Creates views over TPC-H and the `@semantic_models` stage |
| `sales_semantic_model.yaml` | Semantic model definition (tables, measures, relationships, verified queries) |
| `notebook.ipynb` | End-to-end walkthrough: upload model → ask questions → interpret results |

## Dataset

`SNOWFLAKE_SAMPLE_DATA.TPCH_SF1` — available in all Snowflake accounts. No download needed.
Tables used: `ORDERS`, `LINEITEM`, `CUSTOMER`
