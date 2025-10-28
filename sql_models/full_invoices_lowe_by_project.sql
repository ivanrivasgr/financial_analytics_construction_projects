WITH
-- 1️⃣ Totales por factura (desde Custom Spend Report)
invoice_totals AS (
  SELECT
    right(replaceRegexpAll(toString("unnamed_column"), '[^0-9]', ''), 9) AS invoice_custom,
    SUM(
      toFloat64OrZero(
        replaceRegexpAll(toString(total_price), '[^0-9\\.]', '')
      )
    ) AS invoice_total_sum
  FROM "upload_custom_spend_report_1_custom_spend_report_1_2_20251015051153"
  GROUP BY invoice_custom
),

-- 2️⃣ Line Items limpios
items AS (
  SELECT
    parseDateTimeBestEffortOrNull("date") AS item_date,
    trimBoth("po_number") AS po_number_clean,
    "category",
    "sub_category",
    "item_description",
    "brand",
    right(replaceRegexpAll(toString("unnamed_column"), '[^0-9]', ''), 9) AS invoice_custom
  FROM "upload_custom_spend_report_1_custom_spend_report_1_2_20251015051153"
),

-- 3️⃣ Invoices limpios
invoices AS (
  SELECT
    parseDateTimeBestEffortOrNull(
      replaceRegexpAll(trimBoth("date"), '^[^0-9A-Za-z]+|multiple.*$', '')
    ) AS invoice_date,
    "fulfillment_store_location",
    CASE 
      WHEN lower("po_number") IN ('ashly', 'ashley', 'ashly ') THEN 'Ashley'
      WHEN lower("po_number") IN ('patterson', 'pattereson', 'patterson ') THEN 'Patterson'
      WHEN lower("po_number") IN ('vivian', 'vivan', 'vivian ') THEN 'Vivian'
      ELSE "po_number"
    END AS po_number_clean,
    CASE 
      WHEN "cc_type" LIKE '%MC%' THEN 'M/C'
      WHEN "cc_type" LIKE '%AMEX%' THEN 'AMEX'
      WHEN "cc_type" LIKE '%VISA%' THEN 'VISA'
      ELSE "cc_type"
    END AS cc_type_clean,
    "cc___last_4_" AS cc_last_4,
    toFloat64OrZero(replaceAll("order_total", '$', '')) AS order_total_clean
  FROM "upload_lowespro_2025_07_01_to_2025_10_11_68ea89aa3565b145ca339656_20251015025154"
)

-- 4️⃣ Unión: Line Items + Totales + Invoices
SELECT
  i.item_date,
  i.po_number_clean,
  -- 🔹 Mapeo automático de proyecto
  CASE
    WHEN lower(i.po_number_clean) LIKE '%patterson%' THEN 'Construction:HHA-Patterson Pavillion B'
    WHEN lower(i.po_number_clean) LIKE '%Vivian%' THEN 'Construction:HHA-Vivan Villas'
    WHEN lower(i.po_number_clean) LIKE '%Ashley%' THEN 'Construction:HHA-Ashley Apartments'
    ELSE 'Other / Unknown Project'
  END AS project_name,
  i.category,
  i.sub_category,
  i.item_description,
  i.brand,
  inv.fulfillment_store_location,
  inv.cc_type_clean,
  inv.cc_last_4,
  t.invoice_total_sum,
  inv.order_total_clean
FROM items AS i
LEFT JOIN invoice_totals AS t
  ON i.invoice_custom = t.invoice_custom
LEFT JOIN invoices AS inv
  ON t.invoice_total_sum = inv.order_total_clean
ORDER BY i.item_date ASC;
