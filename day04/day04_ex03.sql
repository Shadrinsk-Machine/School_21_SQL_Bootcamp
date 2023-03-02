SELECT date AS missing_date
FROM v_generated_dates
LEFT JOIN person_visits ON date = visit_date
WHERE visit_date is NULL;