"""
generate_invoices.py
Generates sample PDF invoices and uploads them to the Snowflake stage.
Requires: pip install fpdf2 snowflake-connector-python
"""

import os
import io
from fpdf import FPDF
import snowflake.connector

INVOICES = [
    {
        "number": "INV-2024-001",
        "vendor": "Acme Cloud Solutions Ltd",
        "vendor_address": "123 Tech Park, San Francisco, CA 94105",
        "bill_to": "DataCorp International",
        "date": "2024-11-01",
        "due_date": "2024-11-30",
        "items": [
            ("Cloud Storage (1TB/month)", 1, 299.00),
            ("Compute Instances (x4)", 4, 150.00),
            ("Support Package - Premium", 1, 500.00),
        ],
    },
    {
        "number": "INV-2024-002",
        "vendor": "DataFlow Analytics GmbH",
        "vendor_address": "45 Innovation Strasse, Berlin, Germany",
        "bill_to": "Global Retail Group",
        "date": "2024-11-05",
        "due_date": "2024-12-05",
        "items": [
            ("Data Pipeline Setup", 1, 2500.00),
            ("Monthly Platform License", 1, 1200.00),
            ("Training Sessions (x2)", 2, 800.00),
        ],
    },
    {
        "number": "INV-2024-003",
        "vendor": "NexGen Software Corp",
        "vendor_address": "789 Digital Ave, Austin, TX 78701",
        "bill_to": "HealthFirst Insurance",
        "date": "2024-11-10",
        "due_date": "2024-12-10",
        "items": [
            ("Enterprise License (Annual)", 1, 12000.00),
            ("Implementation Services", 40, 175.00),
            ("Data Migration (per GB)", 500, 0.50),
        ],
    },
]


def create_invoice_pdf(invoice: dict) -> bytes:
    pdf = FPDF()
    pdf.add_page()
    pdf.set_margins(20, 20, 20)

    pdf.set_font("Helvetica", "B", 20)
    pdf.cell(0, 10, "INVOICE", ln=True, align="C")
    pdf.ln(5)

    pdf.set_font("Helvetica", "B", 12)
    pdf.cell(0, 8, invoice["vendor"], ln=True)
    pdf.set_font("Helvetica", "", 10)
    pdf.cell(0, 6, invoice["vendor_address"], ln=True)
    pdf.ln(5)

    pdf.set_font("Helvetica", "", 10)
    pdf.cell(90, 6, f"Invoice Number: {invoice['number']}")
    pdf.cell(0, 6, f"Invoice Date: {invoice['date']}", ln=True)
    pdf.cell(90, 6, f"Bill To: {invoice['bill_to']}")
    pdf.cell(0, 6, f"Due Date: {invoice['due_date']}", ln=True)
    pdf.ln(8)

    pdf.set_font("Helvetica", "B", 10)
    pdf.set_fill_color(220, 220, 220)
    pdf.cell(80, 7, "Description", border=1, fill=True)
    pdf.cell(25, 7, "Qty", border=1, fill=True, align="C")
    pdf.cell(35, 7, "Unit Price", border=1, fill=True, align="R")
    pdf.cell(35, 7, "Total", border=1, fill=True, align="R", ln=True)

    pdf.set_font("Helvetica", "", 10)
    subtotal = 0
    for desc, qty, unit_price in invoice["items"]:
        line_total = qty * unit_price
        subtotal += line_total
        pdf.cell(80, 6, desc, border=1)
        pdf.cell(25, 6, str(qty), border=1, align="C")
        pdf.cell(35, 6, f"${unit_price:,.2f}", border=1, align="R")
        pdf.cell(35, 6, f"${line_total:,.2f}", border=1, align="R", ln=True)

    tax = subtotal * 0.1
    total = subtotal + tax

    pdf.ln(2)
    pdf.set_font("Helvetica", "", 10)
    pdf.cell(140, 6, "Subtotal:", align="R")
    pdf.cell(35, 6, f"${subtotal:,.2f}", border=1, align="R", ln=True)
    pdf.cell(140, 6, "Tax (10%):", align="R")
    pdf.cell(35, 6, f"${tax:,.2f}", border=1, align="R", ln=True)
    pdf.set_font("Helvetica", "B", 10)
    pdf.cell(140, 7, "TOTAL DUE:", align="R")
    pdf.cell(35, 7, f"${total:,.2f}", border=1, align="R", ln=True)

    pdf.ln(8)
    pdf.set_font("Helvetica", "I", 9)
    pdf.cell(0, 6, "Payment terms: Net 30 days. Please reference invoice number when making payment.", ln=True)

    return bytes(pdf.output())


def main():
    conn = snowflake.connector.connect(
        connection_name=os.getenv("SNOWFLAKE_CONNECTION_NAME") or "SFCOGSOPS-SNOWHOUSE_AWS_US_WEST_2"
    )
    cur = conn.cursor()
    cur.execute("USE DATABASE GENAI_LEARNING")
    cur.execute("USE SCHEMA PUBLIC")

    for inv in INVOICES:
        filename = f"{inv['number']}.pdf"
        pdf_bytes = create_invoice_pdf(inv)

        with open(f"/tmp/{filename}", "wb") as f:
            f.write(pdf_bytes)

        cur.execute(f"PUT file:///tmp/{filename} @GENAI_LEARNING.PUBLIC.invoice_pdfs OVERWRITE=TRUE AUTO_COMPRESS=FALSE")
        print(f"Uploaded: {filename}")

    print("\nAll invoices uploaded. List stage contents:")
    cur.execute("LIST @GENAI_LEARNING.PUBLIC.invoice_pdfs")
    for row in cur.fetchall():
        print(row)

    conn.close()


if __name__ == "__main__":
    main()
