CREATE VIEW "Home"."29_Salt_Utilities_Overall Statistics_Weighted" AS
WITH
  weighted_stats AS (
    SELECT
      "29_Salt_Utilities_View_Own"."Utility Type",
      (
        sum(
          "29_Salt_Utilities_View_Own"."Covered by Sean(=❶/❷*❸/3)"
        ) / (
          sum(
            "29_Salt_Utilities_View_Own"."❸Days Covered by Sean"
          )
        )::numeric
      ) AS weighted_mean,
      sum(
        "29_Salt_Utilities_View_Own"."❸Days Covered by Sean"
      ) AS total_weight
    FROM
      "Home"."29_Salt_Utilities_View_Own"
    GROUP BY
      "29_Salt_Utilities_View_Own"."Utility Type"
  ),
  weighted_variance AS (
    SELECT
      v_1."Utility Type",
      (
        sum(
          (
            (
              (v_1."Amount Per Day" - ws_1.weighted_mean) ^ (2)::numeric
            ) * (v_1."❸Days Covered by Sean")::numeric
          )
        ) / (ws_1.total_weight)::numeric
      ) AS weighted_variance
    FROM
      (
        "Home"."29_Salt_Utilities_View_Own" v_1
        JOIN weighted_stats ws_1 ON ((v_1."Utility Type" = ws_1."Utility Type"))
      )
    GROUP BY
      v_1."Utility Type",
      ws_1.total_weight,
      ws_1.weighted_mean
  )
SELECT
  ws."Utility Type",
  ws.weighted_mean AS "Weighted Average",
  sqrt(wv.weighted_variance) AS "Weighted Standard Deviation",
  min(v."Amount Per Day") AS "Min",
  max(v."Amount Per Day") AS "Max",
  (sqrt(wv.weighted_variance) / ws.weighted_mean) AS "Coefficient of Variation"
FROM
  (
    (
      weighted_stats ws
      JOIN weighted_variance wv ON ((ws."Utility Type" = wv."Utility Type"))
    )
    JOIN "Home"."29_Salt_Utilities_View_Own" v ON ((ws."Utility Type" = v."Utility Type"))
  )
GROUP BY
  ws."Utility Type",
  ws.weighted_mean,
  wv.weighted_variance;
