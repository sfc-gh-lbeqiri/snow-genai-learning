-- unstructured/cortex-agent-orchestrator/setup.sql
-- Validates all prior tables exist and creates additional objects for the Cortex Agent demo
-- Prerequisites: all phases 1-3 setup.sql files must have been run

USE DATABASE GENAI_LEARNING;
USE SCHEMA PUBLIC;

-- Verify key tables from prior phases exist
SELECT 'orders_vw' AS object_name, COUNT(*) AS row_count FROM orders_vw
UNION ALL SELECT 'product_reviews', COUNT(*) FROM product_reviews
UNION ALL SELECT 'wiki_articles', COUNT(*) FROM wiki_articles
UNION ALL SELECT 'pii_records', COUNT(*) FROM pii_records
UNION ALL SELECT 'customer_feedback', COUNT(*) FROM customer_feedback;

-- Agent conversation log table (for inspecting agent traces)
CREATE TABLE IF NOT EXISTS agent_conversations (
    conversation_id  VARCHAR(50),
    turn_number      NUMBER,
    role             VARCHAR(20),
    content          VARCHAR(16000),
    tool_calls       VARIANT,
    logged_at        TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);
