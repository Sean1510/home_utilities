CREATE VIEW "Home"."29_Salt_Utilities_View" AS
SELECT 
    "Utility Type", "Billing From", 
    "Billing To", 
    "Total Amount" AS "a - Total Amount", ("Billing To" - "Billing From") AS "b - Total days", 
    "Date Starting To Split", 
    ("Billing To" - "Date Starting To Split") AS "c - Days Covered by Sean", 
    round("Total Amount" / ("Billing To" - "Billing From") * ("Billing To" - "Date Starting To Split") / 3, 2) AS "Covered by Sean(=a/b*c/3)", 
    "Paid Date"
FROM "Home"."29_Salt_Utilities"