# AI_TRANSLATE — Multilingual Product Catalog Normalisation

**Data modality:** Semi-Structured
**Feature:** AI_TRANSLATE
**Dataset:** Synthetic multilingual product descriptions (generated inline)

## What this example teaches

How to use `AI_TRANSLATE` to normalise a multilingual product catalog to English, with auto-detection of source language.

## Run instructions

```bash
snow sql -f ../../shared/utils.sql  # once
snow sql -f setup.sql
export SNOWFLAKE_CONNECTION_NAME=<your_connection>
jupyter nbconvert --to notebook --execute notebook.ipynb --inplace
```
