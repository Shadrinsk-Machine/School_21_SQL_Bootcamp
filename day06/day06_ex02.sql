SELECT person.name AS name, menu.pizza_name, menu.price, (menu.price - menu.price / 100 * person_discounts.discount) AS discount_price, pizzeria.name AS pizzeria_name
FROM person
JOIN person_discounts ON person.id = person_discounts.person_id
JOIN pizzeria ON person_discounts.pizzeria_id = pizzeria.id
JOIN menu ON pizzeria.id = menu.pizzeria_id
JOIN person_order ON menu.id = menu_id
WHERE person.id = person_order.person_id
ORDER BY person.name, pizza_name;