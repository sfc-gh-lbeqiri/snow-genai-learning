# AI_PARSE_DOCUMENT — Invoice Processing

| | |
|---|---|
| **Data modality** | Unstructured (PDF documents) |
| **Feature** | `SNOWFLAKE.CORTEX.AI_PARSE_DOCUMENT` |
| **Dataset** | PDF invoices uploaded to `@invoice_pdfs` stage |

## What you will learn

Extract structured data from PDFs using OCR and LAYOUT modes, then chain with COMPLETE for field extraction.

## How to run

1. Open `notebook.ipynb` in **Snowsight** (via a workspace or direct notebook import)
2. Select a warehouse when prompted
3. **Run All** — the notebook creates all objects and data inline

## Dependencies

Upload PDF files to the `@invoice_pdfs` stage before running the parse cells. Use Snowsight upload or PUT.
