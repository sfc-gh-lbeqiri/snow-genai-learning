# AI_EXTRACT — JSON Log Entity Extraction

**Data modality:** Semi-Structured (VARIANT/JSON)
**Feature:** AI_EXTRACT
**Dataset:** Synthetic JSON web server logs (generated inline, no download)

## What this example teaches

How to use `AI_EXTRACT` to pull structured fields out of VARIANT/JSON columns, especially when field names are inconsistent or the data is partially unstructured (like error messages).

## Run instructions

```bash
snow sql -f ../../shared/utils.sql  # once
snow sql -f setup.sql
export SNOWFLAKE_CONNECTION_NAME=<your_connection>
jupyter nbconvert --to notebook --execute notebook.ipynb --inplace
```

## Dataset

200 synthetic JSON web server logs generated inline using `INSERT INTO` + `TABLE(GENERATOR(...))`. No external download required.
