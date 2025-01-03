UPDATE "Home"."29_Salt_Utilities"
SET 
    "Date Ending To Split" = CASE
        WHEN "Same With Billing To?" = 1 THEN "Billing To"
    END,
    "Date Starting To Split" = CASE
        WHEN "Same With Billing From?" = 1 THEN "Billing From"
    END