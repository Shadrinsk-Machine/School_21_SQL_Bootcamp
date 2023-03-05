WITH woman_orders AS (SELECT pizzeria.name AS pizzeria_name FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
	JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person ON person_order.person_id = person.id
	WHERE person.gender= 'female'),
	man_orders AS (SELECT pizzeria.name FROM person_order
	JOIN menu ON person_order.menu_id = menu.id
	JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
	JOIN person ON person_order.person_id = person.id
	WHERE person.gender= 'male'),
	woman_differences AS (SELECT *
	          FROM woman_orders
	          EXCEPT
	          SELECT *
	          FROM man_orders),
	man_differences AS (SELECT *
	          FROM man_orders
	          EXCEPT
	          SELECT *
	          FROM woman_orders)
SELECT *
FROM woman_differences
UNION
SELECT *
FROM man_differences
ORDER BY pizzeria_name;