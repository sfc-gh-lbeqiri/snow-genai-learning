-- unstructured/ai-redact-pii/setup.sql
-- Creates a table with synthetic PII-containing text for AI_REDACT demo
-- All data is completely synthetic — no real personal data

USE DATABASE GENAI_LEARNING;
USE SCHEMA PUBLIC;

CREATE OR REPLACE TABLE pii_records (
    record_id    NUMBER AUTOINCREMENT PRIMARY KEY,
    record_type  VARCHAR(30),
    raw_text     VARCHAR(2000)
);

INSERT INTO pii_records (record_type, raw_text) VALUES
('support_ticket', 'Hi, my name is Sarah Johnson and I need help with my account. My email is sarah.johnson@gmail.com and my phone number is 555-247-8921. My account number is ACC-884421.'),
('support_ticket', 'This is James Miller calling about a billing issue. You can reach me at james.miller@company.org or on my mobile 555-312-6677. My date of birth is March 15, 1985.'),
('onboarding_form', 'Customer: Michael Chen. SSN: 234-56-7890. Address: 42 Oak Street, Portland OR 97201. Credit card on file: 4532-1234-5678-9101. Emergency contact: Linda Chen, 555-991-3344.'),
('onboarding_form', 'New employee: Priya Patel. Employee ID: EMP-77823. Home address: 88 Maple Ave, Chicago IL 60601. SSN: 987-65-4320. Personal email: priya.patel@hotmail.com.'),
('incident_report', 'Incident reported by Emma Wilson (ewilson@enterprise.com, ext. 4421) on behalf of customer Robert Davis, DOB 07/22/1990, phone 555-841-2200. Refund issued to card ending 5891.'),
('chat_log', 'User: Hello, I need to update my shipping address to 15 Pine Road, Seattle WA 98101. My order reference is ORD-992811. Also my new phone is 555-167-4455.'),
('survey_response', 'Respondent: Carlos Rodriguez. Contact: c.rodriguez@outlook.com. I have been a customer since 2019. Overall satisfied but the interface could be improved. My account ID is USR-558821.'),
('medical_note', 'Patient: Dorothy Brown, DOB 12/03/1948. Insurance ID: INS-334421. Next appointment: 555-HEALTH. Primary physician: Dr. Amanda Torres, atorres@clinic.net. Medication: see attached.'),
('legal_document', 'Party A: Thomas Anderson, residing at 200 Elm Street, Boston MA 02101, SSN 112-33-4456, email: t.anderson@lawfirm.com. Party B: Jennifer White, 89 Cedar Lane, Denver CO 80201.'),
('support_ticket', 'From: alice.wong@techcorp.com. Subject: API access issue. Hi team, I am Alice Wong, senior engineer. My Slack is @awong and direct line is 555-723-4411. Ticket ref: TKT-229944.');

SELECT record_id, record_type, LEFT(raw_text, 80) || '...' AS preview FROM pii_records ORDER BY record_id;
