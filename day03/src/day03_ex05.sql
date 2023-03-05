WITH Andrey_visits AS (SELECT pizzeria.name AS pizzeria_name FROM person_visits
    JOIN person ON person_visits.person_id = person.id
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    WHERE person.name = 'Andrey'),
    Andrey_orders AS (SELECT pizzeria.name FROM person_order
    JOIN person ON person.id = person_order.person_id
    JOIN menu ON menu.id = person_order.id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    WHERE person.name = 'Andrey'),
	delete AS (SELECT *
	           FROM Andrey_visits
	           INTERSECT
	           SELECT *
	           FROM Andrey_orders)
SELECT pizzeria_name
FROM delete
ORDER BY pizzeria_name;