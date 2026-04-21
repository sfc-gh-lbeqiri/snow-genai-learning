# AI_PARSE_DOCUMENT — PDF Invoice Data Extraction

**Data modality:** Unstructured (PDF documents)
**Feature:** AI_PARSE_DOCUMENT
**Dataset:** 3 synthetic PDF invoices generated with `generate_invoices.py`

## What this example teaches

How to use `AI_PARSE_DOCUMENT` to extract structured data from PDF files stored on a Snowflake stage, combined with `AI_EXTRACT` for specific field extraction.

## Prerequisites

```bash
pip install fpdf2 snowflake-connector-python
export SNOWFLAKE_CONNECTION_NAME=<your_connection>
python generate_invoices.py   # generates PDFs and uploads to stage
```

## Run instructions

```bash
snow sql -f ../../shared/utils.sql  # once
snow sql -f setup.sql
python generate_invoices.py
jupyter nbconvert --to notebook --execute notebook.ipynb --inplace
```
