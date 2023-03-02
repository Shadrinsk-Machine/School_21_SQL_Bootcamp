SELECT pizza_name AS pizza_name, pizzeria.name AS pizzeria_name, price AS price
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE menu.pizza_name = 'mushroom pizza' OR menu.pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, pizzeria_name;