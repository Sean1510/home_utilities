CREATE VIEW "Home"."29_Salt_Utilities_View" AS
SELECT
  "Utility Type",
  "Billing From",
  "Billing To",
  "Total Amount" AS "a - Total Amount",
  ("Billing To" - "Billing From") AS "b - Total days",
  "Date Starting To Split",
  "Date Ending To Split",
  ("Date Ending To Split" - "Date Starting To Split") AS "c - Days Covered by Sean",
  round(
    (
      (
        (
          "Total Amount" / (("Billing To" - "Billing From"))::numeric
        ) * (
          ("Date Ending To Split" - "Date Starting To Split")
        )::numeric
      ) / (3)::numeric
    ),
    2
  ) AS "Covered by Sean(=a/b*c/3)",
  "Paid Date"
FROM
  "Home"."29_Salt_Utilities"
ORDER BY
  "Paid Date",
  "Utility Type",
  "Billing From";