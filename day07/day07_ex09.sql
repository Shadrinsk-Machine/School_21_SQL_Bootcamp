WITH cte AS (
    SELECT address,
           CAST(age AS numeric(7,2))
    FROM person
),
     cte1 AS (
SELECT address,
       round(MAX(age) - (MIN(age) / MAX(age)), 2) AS formula,
       round(AVG(age), 2) average
FROM cte
GROUP BY address
)
SELECT address, formula, average, formula > average AS comparison
FROM cte1
ORDER BY address;