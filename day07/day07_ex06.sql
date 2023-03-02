SELECT pizzeria.name, COUNT(menu.pizzeria_id), round(AVG(menu.price), 2) AS average_price, MAX(price) AS max_price, MIN(price) AS min_price
FROM person_order
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY pizzeria.name, menu.pizzeria_id
ORDER BY pizzeria.name;