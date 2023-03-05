CREATE VIEW v_price_with_discount AS
    SELECT name, menu.pizza_name, menu.price, round(menu.price - menu.price * 0.1) AS discount_price
    FROM person
    JOIN person_order ON person_order.person_id = person.id
    JOIN menu ON person_order.menu_id = menu.id
ORDER BY name, pizza_name;