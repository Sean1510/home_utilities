CREATE VIEW "Home"."29_Salt_Utilities_View_Own" AS
SELECT 
    "Utility Type", "Billing From", 
    "Billing To", "Total Amount" AS "❶Total Amount", 
    ("Billing To" - "Billing From") AS "❷Total days", 
    "Date Starting To Split", 
    "Date Ending To Split",
    ("Date Ending To Split" - "Date Starting To Split") AS "❸Days Covered by Sean", 
    round("Total Amount" / ("Billing To" - "Billing From") * ("Date Ending To Split" - "Date Starting To Split") / 3, 2) AS "Covered by Sean(=❶/❷*❸/3)", 
    "Paid Date", 
    "Total Amount" / ("Billing To" - "Billing From") / 3 As "Amount Per Day", 
    RANK() OVER (PARTITION BY "Utility Type" ORDER BY "Total Amount" / ("Billing To" - "Billing From") / 3 ASC) AS "Amount Per Day Rank"
FROM "Home"."29_Salt_Utilities"
