UPDATE "Home"."29_Salt_Utilities"
SET 
    "Date Ending To Split" = CASE
        WHEN "Date Ending To Split" IS NULL 
             AND "Same With Billing To?" = 1 THEN "Billing To"
        ELSE "Date Ending To Split"
    END,
    "Date Starting To Split" = CASE
        WHEN "Date Starting To Split" IS NULL 
             AND "Same With Billing From?" = 1 THEN "Billing From"
        ELSE "Date Starting To Split"
    END;