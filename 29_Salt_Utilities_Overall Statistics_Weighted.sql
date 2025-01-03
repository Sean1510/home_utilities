CREATE VIEW "Home"."29_Salt_Utilities_Overall Statistics_Weighted" AS
WITH weighted_stats AS (
  SELECT
    "Utility Type",
    SUM("Covered by Sean(=❶/❷*❸/3)") / SUM("❸Days Covered by Sean") AS weighted_mean,
    SUM("❸Days Covered by Sean") AS total_weight
  FROM
    "Home"."29_Salt_Utilities_View_Own"
  GROUP BY
    "Utility Type"
),
weighted_variance AS (
  SELECT
    v."Utility Type",
    SUM(
      (("Amount Per Day" - ws.weighted_mean) ^ 2) * ("❸Days Covered by Sean")
    ) / ws.total_weight AS weighted_variance
  FROM
    "Home"."29_Salt_Utilities_View_Own" v
  JOIN
    weighted_stats ws
  ON
    v."Utility Type" = ws."Utility Type"
  GROUP BY
    v."Utility Type", ws.total_weight, ws.weighted_mean
)
SELECT
  ws."Utility Type",
  ws.weighted_mean AS "Weighted Average",
  SQRT(wv.weighted_variance) AS "Weighted Standard Deviation",
  MIN(v."Amount Per Day") AS "Min",
  MAX(v."Amount Per Day") AS "Max",
  (SQRT(wv.weighted_variance) / ws.weighted_mean) AS "Coefficient of Variation"
FROM
  weighted_stats ws
JOIN
  weighted_variance wv
ON
  ws."Utility Type" = wv."Utility Type"
JOIN
  "Home"."29_Salt_Utilities_View_Own" v
ON
  ws."Utility Type" = v."Utility Type"
GROUP BY
  ws."Utility Type", ws.weighted_mean, wv.weighted_variance
