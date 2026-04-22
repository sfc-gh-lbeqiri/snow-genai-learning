# Cortex Search + RAG — Semantic Search & Retrieval-Augmented Generation

| | |
|---|---|
| **Data modality** | Unstructured (text documents) |
| **Feature** | `EMBED_TEXT_1024`, `VECTOR_COSINE_SIMILARITY`, Cortex Search Service, `CORTEX.COMPLETE` |
| **Dataset** | Wiki articles from the AI_SUMMARIZE lab |

## What you will learn

Three approaches: manual vector search → managed Cortex Search Service → full RAG pipeline.

## How to run

1. Open `notebook.ipynb` in **Snowsight** (via a workspace or direct notebook import)
2. Select a warehouse when prompted
3. **Run All** — the notebook creates all objects and data inline

## Dependencies

Run the **AI_SUMMARIZE** lab first to create the `wiki_articles` table.
