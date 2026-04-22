# Cortex Analyst — Natural Language Sales Q&A

| | |
|---|---|
| **Data modality** | Structured |
| **Feature** | Cortex Analyst (text-to-SQL via semantic model) |
| **Dataset** | TPC-H ORDERS, LINEITEM, CUSTOMER views + `sales_semantic_model.yaml` |

## What you will learn

Convert natural-language questions into SQL using a YAML semantic model staged in Snowflake.

## How to run

1. Open `notebook.ipynb` in **Snowsight** (via a workspace or direct notebook import)
2. Select a warehouse when prompted
3. **Run All** — the notebook creates all objects and data inline

## Dependencies

None. The `sales_semantic_model.yaml` file is included in this directory.
