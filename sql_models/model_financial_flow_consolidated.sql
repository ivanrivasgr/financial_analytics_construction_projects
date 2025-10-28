SELECT
  parseDateTimeBestEffortOrNull("clean_date") AS clean_date,
  "project_name",
  "source",
  
  -- 💰 Net flow (Income - Expense)
  ROUND(SUM(
    CASE 
      WHEN "split" ILIKE '%Accounts Receivable%' THEN ABS("amount")
      ELSE -ABS("amount")
    END
  ), 2) AS net_flow,
  
  -- 💵 Total Income
  ROUND(SUM(
    CASE 
      WHEN "split" ILIKE '%Accounts Receivable%' THEN ABS("amount")
      ELSE 0
    END
  ), 2) AS total_income,
  
  -- 💸 Total Expense
  ROUND(SUM(
    CASE 
      WHEN "split" ILIKE '%Accounts Receivable%' THEN 0
      ELSE ABS("amount")
    END
  ), 2) AS total_expense

FROM (
  -- 🔹 Villas - P&L
  SELECT
    "date" AS clean_date,
    "class" AS project_name,
    "name" AS entity_name,
    "memo",
    "split",
    "amount",
    'Villas - P&L' AS source
  FROM "upload_p_l_villas_p_l_villas_20251015024504"

  UNION ALL

  -- 🔹 Villas - Process
  SELECT
    "date" AS clean_date,
    "class" AS project_name,
    "name" AS entity_name,
    "memo",
    "split",
    "amount",
    'Villas - Process' AS source
  FROM "upload_process_villas_process_villas_20251015024758"

  UNION ALL

  -- 🔹 Patterson - P&L
  SELECT
    "date" AS clean_date,
    "class" AS project_name,
    "name" AS entity_name,
    "memo",
    "split",
    "amount",
    'Patterson - P&L' AS source
  FROM "upload_p_l_patterson_p_l_patterson_20251015025034"

  UNION ALL

  -- 🔹 Patterson - Process
  SELECT
    "date" AS clean_date,
    "class" AS project_name,
    "name" AS entity_name,
    "memo",
    "split",
    "amount",
    'Patterson - Process' AS source
  FROM "upload_process_patterson_process_patterson_20251015023812"
)
GROUP BY
  clean_date,
  project_name,
  source
ORDER BY
  clean_date ASC;
