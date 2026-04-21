-- semi-structured/ai-extract-logs/setup.sql
-- Creates a table with synthetic JSON web server logs stored as VARIANT
-- Data generated inline using GENERATOR — no external download needed

USE DATABASE GENAI_LEARNING;
USE SCHEMA PUBLIC;

CREATE OR REPLACE TABLE web_server_logs (
    log_id      NUMBER AUTOINCREMENT PRIMARY KEY,
    log_ts      TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    raw_log     VARIANT
);

INSERT INTO web_server_logs (raw_log)
SELECT PARSE_JSON(v) FROM (VALUES
('{"ip":"192.168.1.45","method":"GET","path":"/api/v1/orders","status":200,"duration_ms":142,"user_agent":"Mozilla/5.0","error":null,"user_id":"u_8821"}'),
('{"ip":"10.0.0.23","method":"POST","path":"/api/v1/checkout","status":500,"duration_ms":3210,"user_agent":"Chrome/115","error":"Database connection timeout","user_id":"u_2234"}'),
('{"ip":"172.16.0.88","method":"GET","path":"/api/v1/products","status":200,"duration_ms":89,"user_agent":"Safari/16","error":null,"user_id":"u_4401"}'),
('{"ip":"10.0.0.56","method":"DELETE","path":"/api/v1/users/9921","status":403,"duration_ms":45,"user_agent":"Postman","error":"Forbidden: insufficient permissions","user_id":"u_0011"}'),
('{"ip":"192.168.2.100","method":"GET","path":"/api/v1/reports/monthly","status":504,"duration_ms":30001,"user_agent":"Python-requests","error":"Gateway timeout","user_id":"u_7755"}'),
('{"ip":"10.0.0.23","method":"PUT","path":"/api/v1/cart/add","status":200,"duration_ms":201,"user_agent":"Chrome/115","error":null,"user_id":"u_2234"}'),
('{"ip":"192.168.1.12","method":"GET","path":"/api/v1/search?q=laptop","status":200,"duration_ms":330,"user_agent":"Firefox/120","error":null,"user_id":"u_3380"}'),
('{"ip":"10.0.1.50","method":"POST","path":"/api/v1/auth/login","status":401,"duration_ms":55,"user_agent":"Mobile/iOS","error":"Invalid credentials","user_id":null}'),
('{"ip":"172.16.0.12","method":"GET","path":"/api/v1/inventory","status":200,"duration_ms":178,"user_agent":"Java/17","error":null,"user_id":"u_9010"}'),
('{"ip":"10.0.0.88","method":"POST","path":"/api/v1/payments","status":500,"duration_ms":5500,"user_agent":"Chrome/115","error":"Payment gateway unreachable","user_id":"u_6612"}'),
('{"ip":"192.168.1.45","method":"GET","path":"/api/v1/orders/8821","status":404,"duration_ms":22,"user_agent":"Mozilla/5.0","error":"Order not found","user_id":"u_8821"}'),
('{"ip":"10.0.0.34","method":"POST","path":"/api/v1/orders","status":201,"duration_ms":456,"user_agent":"Chrome/115","error":null,"user_id":"u_1122"}'),
('{"ip":"172.16.5.5","method":"GET","path":"/health","status":200,"duration_ms":5,"user_agent":"LoadBalancer","error":null,"user_id":null}'),
('{"ip":"10.0.0.23","method":"GET","path":"/api/v1/orders/history","status":200,"duration_ms":980,"user_agent":"Chrome/115","error":null,"user_id":"u_2234"}'),
('{"ip":"192.168.3.77","method":"POST","path":"/api/v1/returns","status":500,"duration_ms":2100,"user_agent":"Safari/16","error":"Internal server error: NullPointerException","user_id":"u_5599"}')
) AS t(v);

INSERT INTO web_server_logs (raw_log)
SELECT PARSE_JSON(
    '{"ip":"10.0.' || UNIFORM(0,5,RANDOM())::STRING || '.' || UNIFORM(1,254,RANDOM())::STRING ||
    '","method":"' || CASE MOD(SEQ4(),4) WHEN 0 THEN 'GET' WHEN 1 THEN 'POST' WHEN 2 THEN 'PUT' ELSE 'DELETE' END ||
    '","path":"/api/v1/' || CASE MOD(SEQ4(),6) WHEN 0 THEN 'orders' WHEN 1 THEN 'products' WHEN 2 THEN 'users' WHEN 3 THEN 'cart' WHEN 4 THEN 'search' ELSE 'inventory' END ||
    '","status":' || CASE WHEN UNIFORM(0,10,RANDOM()) < 7 THEN '200' WHEN UNIFORM(0,10,RANDOM()) < 8 THEN '404' ELSE '500' END ||
    ',"duration_ms":' || UNIFORM(10,5000,RANDOM())::STRING ||
    ',"error":' || CASE WHEN UNIFORM(0,10,RANDOM()) < 7 THEN 'null' ELSE '"Unexpected error code ' || UNIFORM(1000,9999,RANDOM())::STRING || '"' END ||
    ',"user_id":"u_' || UNIFORM(1000,9999,RANDOM())::STRING || '"}'
)
FROM TABLE(GENERATOR(ROWCOUNT => 185));

SELECT COUNT(*) AS total_logs FROM web_server_logs;
