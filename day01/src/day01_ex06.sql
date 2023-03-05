SELECT order_date AS action_date, (Select name FROM person WHERE id = person_id) AS person_name
FROM person_order
INTERSECT
SELECT visit_date, (Select name FROM person WHERE id = person_id)
FROM person_visits
ORDER BY action_date, person_name DESC;