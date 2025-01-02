CREATE VIEW "Home"."29_Salt_Utilities_Max & Min" AS
WITH stats AS (
  SELECT
    "Utility Type",
    min("Amount Per Day") AS min_amount,
    max("Amount Per Day") AS max_amount
  FROM
    "Home"."29_Salt_Utilities_View_Own"
  GROUP BY
    "Utility Type"
)
SELECT
  v.*
FROM
  "Home"."29_Salt_Utilities_View_Own" v
JOIN
  stats s
ON
  v."Utility Type" = s."Utility Type"
WHERE
  v."Amount Per Day" = s.min_amount
  OR v."Amount Per Day" = s.max_amount;
