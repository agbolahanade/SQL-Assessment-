# DataAnalytics-Assessment

## Overview
This repository contains SQL solutions for a proficiency assessment based on customer transaction data. The queries were developed for efficiency, accuracy, and clarity.

---

## Question Explanations

### Q1: High-Value Customers with Multiple Products
I joined the savings and plans tables based on conditions for savings (`is_regular_savings`) and investment (`is_a_fund`), filtered only funded plans, and grouped by customer to count and total their deposits.

### Q2: Transaction Frequency Analysis
I first grouped transactions monthly and averaged them per customer. Then I categorized each customer and aggregated counts per category.

### Q3: Account Inactivity Alert
I unified savings and investment records, checked the days since last transaction, and filtered accounts with no activity over 365 days.

### Q4: Customer Lifetime Value (CLV)
I calculated tenure in months, total transactions, and estimated CLV using the formula provided, handling division by zero with `NULLIF`.

---

## Challenges
- Missing schema specifics like column names and formats (assumed reasonable names based on conventions).
- Ensuring accurate kobo-to-naira conversion.
- Avoiding divide-by-zero errors.
