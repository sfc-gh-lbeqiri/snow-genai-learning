-- unstructured/ai-parse-invoices/setup.sql
-- Creates a stage for PDF invoices and a results table
-- PDFs must be generated using the companion Python script: generate_invoices.py

USE DATABASE GENAI_LEARNING;
USE SCHEMA PUBLIC;

CREATE STAGE IF NOT EXISTS invoice_pdfs
    COMMENT = 'Stores sample PDF invoices for AI_PARSE_DOCUMENT demo';

CREATE OR REPLACE TABLE invoice_parse_results (
    invoice_file    VARCHAR(200),
    parsed_at       TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    raw_extraction  VARIANT,
    vendor_name     VARCHAR(200),
    invoice_number  VARCHAR(50),
    invoice_date    VARCHAR(20),
    due_date        VARCHAR(20),
    total_amount    VARCHAR(50),
    line_items      VARIANT
);
