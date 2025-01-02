CREATE VIEW "Home"."29_Salt_Utilities_Overall Statistics" AS
SELECT
    "Utility Type",
    AVG("Amount Per Day") AS "Average",
    STDDEV("Amount Per Day") AS "Standard Deviation",
    MIN("Amount Per Day") AS "Min",
    MAX("Amount Per Day") AS "Max",
    STDDEV("Amount Per Day") / AVG("Amount Per Day") AS "Coefficient of Variation"
FROM 
    "Home"."29_Salt_Utilities_View_Own"
GROUP BY "Utility Type";