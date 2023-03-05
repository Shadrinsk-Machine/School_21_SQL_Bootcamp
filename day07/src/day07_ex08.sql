SELECT person.address, pizzeria.name, COUNT(pizzeria_id) count_of_orders
FROM person_order
JOIN person ON person.id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY person.address, pizzeria.name, pizzeria_id
ORDER BY address, pizzeria.name;