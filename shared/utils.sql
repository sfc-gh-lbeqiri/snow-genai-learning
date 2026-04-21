-- shared/utils.sql
-- Run this ONCE before any use-case setup.sql
-- Creates the shared database and schema used by all examples

CREATE DATABASE IF NOT EXISTS GENAI_LEARNING;
CREATE SCHEMA IF NOT EXISTS GENAI_LEARNING.PUBLIC;

USE DATABASE GENAI_LEARNING;
USE SCHEMA PUBLIC;

-- Shared warehouse (create if your account doesn't have a default)
-- CREATE WAREHOUSE IF NOT EXISTS GENAI_WH
--   WAREHOUSE_SIZE = 'XSMALL'
--   AUTO_SUSPEND = 60
--   AUTO_RESUME = TRUE;
