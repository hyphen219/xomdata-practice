-- Xom Data · Branch code from the invoice number
-- Problem: https://xomdata.com/practice/easy-substr-001
-- Solved: 2026-08-07

-- Viết SQL của bạn ở đây
select
    invoice_code,
    substr(invoice_code,1 , 3) as branch_code
from invoices;
