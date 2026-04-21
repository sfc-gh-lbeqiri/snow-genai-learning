# AI_REDACT — PII Redaction from Unstructured Text

**Data modality:** Unstructured (free-text records)
**Feature:** AI_REDACT
**Dataset:** Synthetic PII-containing records (inserted inline, no download)

## What this example teaches

How to use `AI_REDACT` to automatically redact PII from free-text columns, with selective redaction by record type and a safe analytics view pattern.

## Run instructions

```bash
snow sql -f ../../shared/utils.sql  # once
snow sql -f setup.sql
export SNOWFLAKE_CONNECTION_NAME=<your_connection>
jupyter nbconvert --to notebook --execute notebook.ipynb --inplace
```
