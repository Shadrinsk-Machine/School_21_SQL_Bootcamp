WITH order_ AS (
    SELECT p1.name, count(menu.pizzeria_id) AS COUNT, ('order') AS action_type
    FROM person_order
             JOIN menu ON person_order.menu_id = menu.id
             JOIN pizzeria p1 ON p1.id = menu.pizzeria_id
    GROUP BY p1.name
    ORDER BY action_type, COUNT DESC
    LIMIT 3
),
     visit_ AS (
         SELECT p2.name, count(person_visits.pizzeria_id) AS COUNT, ('visit') action_type
         FROM person_visits
                  JOIN pizzeria p2 ON p2.id = person_visits.pizzeria_id
         GROUP BY p2.name
         ORDER BY action_type, COUNT DESC
         LIMIT 3
)
SELECT *
FROM order_
UNION
(SELECT * FROM visit_)
ORDER BY action_type, COUNT DESC;