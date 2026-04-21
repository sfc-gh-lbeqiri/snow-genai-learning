-- structured/ai-classify-orders/setup.sql
-- Creates a view over TPC-H ORDERS for AI_CLASSIFY demo

USE DATABASE GENAI_LEARNING;
USE SCHEMA PUBLIC;

CREATE OR REPLACE VIEW order_comments_vw AS
SELECT
    o_orderkey    AS order_key,
    o_orderdate   AS order_date,
    o_orderstatus AS order_status,
    o_totalprice  AS total_price,
    o_comment     AS order_comment
FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS
WHERE o_comment IS NOT NULL
  AND LENGTH(o_comment) > 10;
