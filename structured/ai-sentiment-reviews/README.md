# AI_SENTIMENT — Product Review Sentiment Analysis

**Data modality:** Structured
**Feature:** AI_SENTIMENT
**Dataset:** Synthetic product reviews (generated inline, no download)

## What this example teaches

How to use `AI_SENTIMENT` to score free-text reviews on a -1 to +1 scale, validate results against star ratings, and identify products needing attention.

## Run instructions

```bash
snow sql -f ../../shared/utils.sql  # once
snow sql -f setup.sql
export SNOWFLAKE_CONNECTION_NAME=<your_connection>
jupyter nbconvert --to notebook --execute notebook.ipynb --inplace
```

## Dataset

30 synthetic product reviews generated inline via `INSERT INTO` statements. No external download required.
