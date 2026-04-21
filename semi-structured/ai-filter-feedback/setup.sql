-- semi-structured/ai-filter-feedback/setup.sql
-- Creates a table with synthetic customer feedback JSON for AI_FILTER demo

USE DATABASE GENAI_LEARNING;
USE SCHEMA PUBLIC;

CREATE OR REPLACE TABLE customer_feedback (
    feedback_id   NUMBER AUTOINCREMENT PRIMARY KEY,
    submitted_at  TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    product_name  VARCHAR(100),
    channel       VARCHAR(30),
    feedback      VARIANT
);

INSERT INTO customer_feedback (product_name, channel, feedback) VALUES
('Mobile App', 'in-app', PARSE_JSON('{"text":"The new checkout flow is confusing. I tried to update my payment method three times and kept getting an error. Lost my cart twice.","rating":2,"user_tier":"premium"}')),
('Mobile App', 'email', PARSE_JSON('{"text":"Love the new dark mode! Finally. Looks great.","rating":5,"user_tier":"free"}')),
('Mobile App', 'in-app', PARSE_JSON('{"text":"App crashes every time I try to view order history on iPhone 15. This is a bug you need to fix urgently.","rating":1,"user_tier":"premium"}')),
('Mobile App', 'survey', PARSE_JSON('{"text":"Generally happy with the app. Could use better search filters.","rating":4,"user_tier":"free"}')),
('Mobile App', 'in-app', PARSE_JSON('{"text":"Notifications are not working. I missed a delivery because I never got an alert.","rating":2,"user_tier":"premium"}')),
('Data Platform', 'email', PARSE_JSON('{"text":"The query performance has degraded significantly over the last two weeks. Our dashboards are timing out.","rating":1,"user_tier":"enterprise"}')),
('Data Platform', 'support', PARSE_JSON('{"text":"Documentation for the new API endpoints is incomplete. Missing authentication examples.","rating":3,"user_tier":"enterprise"}')),
('Data Platform', 'survey', PARSE_JSON('{"text":"Great product overall. The integration with our existing stack was seamless.","rating":5,"user_tier":"enterprise"}')),
('Data Platform', 'email', PARSE_JSON('{"text":"We are experiencing data latency issues in the EU region. This is affecting our SLA commitments to our customers.","rating":1,"user_tier":"enterprise"}')),
('Data Platform', 'in-app', PARSE_JSON('{"text":"Feature request: would love to see column-level lineage in the UI.","rating":4,"user_tier":"professional"}')),
('Support Portal', 'survey', PARSE_JSON('{"text":"Waited 4 days for a response to a P1 ticket. This is unacceptable for an enterprise customer.","rating":1,"user_tier":"enterprise"}')),
('Support Portal', 'email', PARSE_JSON('{"text":"The self-service knowledge base articles are outdated. Half the screenshots do not match the current UI.","rating":2,"user_tier":"professional"}')),
('Support Portal', 'in-app', PARSE_JSON('{"text":"Fast response times and the support engineer really understood our use case. Excellent experience.","rating":5,"user_tier":"free"}')),
('Support Portal', 'survey', PARSE_JSON('{"text":"It would be helpful to have live chat as an option, not just email tickets.","rating":3,"user_tier":"free"}')),
('Billing', 'email', PARSE_JSON('{"text":"I was charged twice this month and the invoice shows the wrong amount. Need this corrected immediately.","rating":1,"user_tier":"premium"}')),
('Billing', 'support', PARSE_JSON('{"text":"The new pricing page is clearer than before. Good update.","rating":4,"user_tier":"free"}')),
('Billing', 'email', PARSE_JSON('{"text":"Cannot download invoices for audit purposes. The export button does nothing in Chrome.","rating":2,"user_tier":"enterprise"}')),
('Onboarding', 'survey', PARSE_JSON('{"text":"The onboarding wizard was helpful and I was up and running in under an hour.","rating":5,"user_tier":"free"}')),
('Onboarding', 'in-app', PARSE_JSON('{"text":"No video tutorials available. Written docs only. Would strongly prefer walkthrough videos.","rating":3,"user_tier":"professional"}')),
('Mobile App', 'email', PARSE_JSON('{"text":"Search is completely broken after the last update. Returns zero results for everything.","rating":1,"user_tier":"premium"}'));

SELECT COUNT(*) AS total_feedback FROM customer_feedback;
