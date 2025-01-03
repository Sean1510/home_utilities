ALTER TABLE "Home"."29_Salt_Utilities"
ALTER COLUMN "Date Starting To Split" 
SET DEFAULT NULL,
ALTER COLUMN "Date Ending To Split" 
SET DEFAULT NULL;

ALTER TABLE "Home"."29_Salt_Utilities"
ALTER COLUMN "Date Starting To Split" 
SET GENERATED ALWAYS AS (
    CASE 
        WHEN "Same With Billing From?" = 1 THEN "Billing From"
        ELSE "Date Starting To Split"
    END
) STORED;

ALTER TABLE "Home"."29_Salt_Utilities"
ALTER COLUMN "Date Ending To Split" 
SET GENERATED ALWAYS AS (
    CASE 
        WHEN "Same With Billing To?" = 1 THEN "Billing To"
        ELSE "Date Ending To Split"
    END
) STORED;