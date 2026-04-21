# AI_SUMMARIZE — Wikipedia Article Summarisation

**Data modality:** Unstructured (long-form text)
**Feature:** AI_SUMMARIZE
**Dataset:** 5 synthetic Wikipedia-style articles (inserted inline, no download)

## What this example teaches

How to use `AI_SUMMARIZE` to condense long-form text into concise summaries, including batch processing and comparison with targeted `CORTEX.COMPLETE` prompts.

## Run instructions

```bash
snow sql -f ../../shared/utils.sql  # once
snow sql -f setup.sql
export SNOWFLAKE_CONNECTION_NAME=<your_connection>
jupyter nbconvert --to notebook --execute notebook.ipynb --inplace
```
