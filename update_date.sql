UPDATE "Home"."29_Salt_Utilities"
SET 
    "Date Ending To Split" = CASE
        WHEN "Same With Billing To?" = 1 AND "Date Ending To Split" IS NULL THEN "Billing To"
        ELSE "Date Ending To Split" -- Keep existing value if not null
    END,
    "Date Starting To Split" = CASE
        WHEN "Same With Billing From?" = 1 AND "Date Starting To Split" IS NULL THEN "Billing From"
        ELSE "Date Starting To Split" -- Keep existing value if not null
    END