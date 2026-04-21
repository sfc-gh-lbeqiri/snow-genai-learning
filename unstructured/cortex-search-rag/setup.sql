-- unstructured/cortex-search-rag/setup.sql
-- Creates a Cortex Search Service over the wiki_articles table
-- Prerequisite: run unstructured/ai-summarize-articles/setup.sql first

USE DATABASE GENAI_LEARNING;
USE SCHEMA PUBLIC;

-- Create an embeddings table for the manual vector search demo (Step 3)
CREATE OR REPLACE TABLE article_embeddings AS
SELECT
    article_id,
    title,
    category,
    body,
    SNOWFLAKE.CORTEX.EMBED_TEXT_1024('e5-base-v2', body) AS embedding
FROM wiki_articles;

-- Create the Cortex Search Service over the articles
-- This indexes the body text for semantic search queries
CREATE OR REPLACE CORTEX SEARCH SERVICE wiki_search
    ON body
    ATTRIBUTES title, category
    WAREHOUSE = COMPUTE_WH
    TARGET_LAG = '1 minute'
    AS (
        SELECT
            article_id,
            title,
            category,
            body
        FROM wiki_articles
    );
