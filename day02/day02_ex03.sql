WITH CTE AS (
    SELECT missing_date.date AS missing_date
    FROM generate_series(date '2022-01-01', date '2022-01-10', '1 day') AS missing_date
)
SELECT CTE.missing_date
FROM CTE
LEFT JOIN (SELECT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) AS visit_date ON missing_date = visit_date
WHERE visit_date is NULL
ORDER BY visit_date;