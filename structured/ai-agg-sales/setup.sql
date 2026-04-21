-- structured/ai-agg-sales/setup.sql
-- Creates a view over TPC-H LINEITEM for AI_AGG demo

USE DATABASE GENAI_LEARNING;
USE SCHEMA PUBLIC;

CREATE OR REPLACE VIEW lineitem_comments_vw AS
SELECT
    l_orderkey   AS order_key,
    l_returnflag AS return_flag,
    l_linestatus AS line_status,
    l_shipmode   AS ship_mode,
    l_quantity   AS quantity,
    l_extendedprice  AS extended_price,
    l_discount   AS discount,
    l_comment    AS line_comment
FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.LINEITEM
WHERE l_comment IS NOT NULL
  AND LENGTH(l_comment) > 5;
