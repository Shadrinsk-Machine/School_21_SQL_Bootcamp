WITH order_ AS (
    SELECT p1.name, COUNT(menu.pizzeria_id) AS COUNT, ('order') AS action_type
    FROM person_order
             JOIN menu ON person_order.menu_id = menu.id
             JOIN pizzeria p1 on p1.id = menu.pizzeria_id
    GROUP BY p1.name
    ORDER BY action_type, COUNT DESC
),
     visit_ AS (
         SELECT p2.name, COUNT(person_visits.pizzeria_id) COUNT, ('visit') action_type
         FROM person_visits
                  JOIN pizzeria p2 ON p2.id = person_visits.pizzeria_id
         GROUP BY p2.name
         ORDER BY action_type, count DESC
)
SELECT order_.name, (order_.count + visit_.count) AS total_count
FROM order_
JOIN visit_ ON order_.name = visit_.name;