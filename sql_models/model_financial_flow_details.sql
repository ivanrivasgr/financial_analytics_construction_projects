-- 🔹 VILLAS P&L
SELECT
  parseDateTimeBestEffortOrNull("date") AS clean_date,
  "class" AS project_name,
  "name" AS entity_name,
  "type" AS type,
  "account" AS account_name,
  "split" AS split,
  "memo",
  CASE 
    WHEN "split" ILIKE '%Accounts Receivable%' THEN ABS("amount")
    ELSE 0
  END AS income_amount,
  CASE 
    WHEN "split" ILIKE '%Accounts Receivable%' THEN 0
    ELSE ABS("amount")
  END AS expense_amount,
  CASE 
    WHEN "split" ILIKE '%Accounts Receivable%' THEN ABS("amount")
    ELSE -ABS("amount")
  END AS signed_amount,
  CASE 
    WHEN "split" ILIKE '%Accounts Receivable%' THEN 'Income'
    ELSE 'Expense'
  END AS direction,
  'Villas - P&L' AS source
FROM "upload_p_l_villas_p_l_villas_20251015024504"

UNION ALL

-- 🔹 VILLAS PROCESS (no tiene columna 'account')
SELECT
  parseDateTimeBestEffortOrNull("date") AS clean_date,
  "class" AS project_name,
  "name" AS entity_name,
  "type" AS type,
  NULL AS account_name,
  "split" AS split,
  "memo",
  CASE 
    WHEN "split" ILIKE '%Accounts Receivable%' THEN ABS("amount")
    ELSE 0
  END AS income_amount,
  CASE 
    WHEN "split" ILIKE '%Accounts Receivable%' THEN 0
    ELSE ABS("amount")
  END AS expense_amount,
  CASE 
    WHEN "split" ILIKE '%Accounts Receivable%' THEN ABS("amount")
    ELSE -ABS("amount")
  END AS signed_amount,
  CASE 
    WHEN "split" ILIKE '%Accounts Receivable%' THEN 'Income'
    ELSE 'Expense'
  END AS direction,
  'Villas - Process' AS source
FROM "upload_process_villas_process_villas_20251015024758"

UNION ALL

-- 🔹 PATTERSON P&L
SELECT
  parseDateTimeBestEffortOrNull("date") AS clean_date,
  "class" AS project_name,
  "name" AS entity_name,
  "type" AS type,
  "account" AS account_name,
  "split" AS split,
  "memo",
  CASE 
    WHEN "split" ILIKE '%Accounts Receivable%' THEN ABS("amount")
    ELSE 0
  END AS income_amount,
  CASE 
    WHEN "split" ILIKE '%Accounts Receivable%' THEN 0
    ELSE ABS("amount")
  END AS expense_amount,
  CASE 
    WHEN "split" ILIKE '%Accounts Receivable%' THEN ABS("amount")
    ELSE -ABS("amount")
  END AS signed_amount,
  CASE 
    WHEN "split" ILIKE '%Accounts Receivable%' THEN 'Income'
    ELSE 'Expense'
  END AS direction,
  'Patterson - P&L' AS source
FROM "upload_p_l_patterson_p_l_patterson_20251015025034"

UNION ALL

-- 🔹 PATTERSON PROCESS (no tiene columna 'account')
SELECT
  parseDateTimeBestEffortOrNull("date") AS clean_date,
  "class" AS project_name,
  "name" AS entity_name,
  "type" AS type,
  NULL AS account_name,
  "split" AS split,
  "memo",
  CASE 
    WHEN "split" ILIKE '%Accounts Receivable%' THEN ABS("amount")
    ELSE 0
  END AS income_amount,
  CASE 
    WHEN "split" ILIKE '%Accounts Receivable%' THEN 0
    ELSE ABS("amount")
  END AS expense_amount,
  CASE 
    WHEN "split" ILIKE '%Accounts Receivable%' THEN ABS("amount")
    ELSE -ABS("amount")
  END AS signed_amount,
  CASE 
    WHEN "split" ILIKE '%Accounts Receivable%' THEN 'Income'
    ELSE 'Expense'
  END AS direction,
  'Patterson - Process' AS source
FROM "upload_process_patterson_process_patterson_20251015023812";
