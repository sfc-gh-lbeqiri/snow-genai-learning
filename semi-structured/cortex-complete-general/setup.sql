-- semi-structured/cortex-complete-general/setup.sql
-- No dedicated tables needed — uses tables from prior phases
-- Verify GENAI_LEARNING.PUBLIC exists with earlier data

USE DATABASE GENAI_LEARNING;
USE SCHEMA PUBLIC;

-- Create a prompts log table to track experiments
CREATE TABLE IF NOT EXISTS prompt_experiments (
    experiment_id  NUMBER AUTOINCREMENT PRIMARY KEY,
    run_at         TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    pattern        VARCHAR(50),
    model_used     VARCHAR(50),
    prompt_text    VARCHAR(4000),
    response_text  VARCHAR(16000)
);
