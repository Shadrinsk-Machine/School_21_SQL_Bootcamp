SELECT name, rating
FROM pizzeria
LEFT JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
WHERE pizzeria_id IS NULL;