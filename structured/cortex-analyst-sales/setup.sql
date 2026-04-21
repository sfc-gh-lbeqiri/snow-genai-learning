-- structured/cortex-analyst-sales/setup.sql
-- Creates views over SNOWFLAKE_SAMPLE_DATA TPC-H tables
-- and an internal stage for the semantic model YAML

USE DATABASE GENAI_LEARNING;
USE SCHEMA PUBLIC;

CREATE OR REPLACE VIEW orders_vw AS
SELECT
    o_orderkey       AS order_key,
    o_custkey        AS customer_key,
    o_orderstatus    AS order_status,
    o_totalprice     AS total_price,
    o_orderdate      AS order_date,
    o_orderpriority  AS order_priority,
    o_clerk          AS clerk,
    o_shippriority   AS ship_priority,
    o_comment        AS order_comment
FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS;

CREATE OR REPLACE VIEW lineitem_vw AS
SELECT
    l_orderkey       AS order_key,
    l_partkey        AS part_key,
    l_suppkey        AS supplier_key,
    l_linenumber     AS line_number,
    l_quantity       AS quantity,
    l_extendedprice  AS extended_price,
    l_discount       AS discount,
    l_tax            AS tax,
    l_returnflag     AS return_flag,
    l_linestatus     AS line_status,
    l_shipdate       AS ship_date,
    l_commitdate     AS commit_date,
    l_receiptdate    AS receipt_date,
    l_shipinstruct   AS ship_instruct,
    l_shipmode       AS ship_mode,
    l_comment        AS line_comment
FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.LINEITEM;

CREATE OR REPLACE VIEW customer_vw AS
SELECT
    c_custkey        AS customer_key,
    c_name           AS customer_name,
    c_address        AS address,
    c_nationkey      AS nation_key,
    c_phone          AS phone,
    c_acctbal        AS account_balance,
    c_mktsegment     AS market_segment,
    c_comment        AS customer_comment
FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER;

CREATE STAGE IF NOT EXISTS semantic_models
    COMMENT = 'Stores Cortex Analyst semantic model YAML files';
