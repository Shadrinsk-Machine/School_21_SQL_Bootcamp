INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT max(id) + 1 FROM person_visits), (SELECT id FROM person WHERE name = 'Dmitriy'),
    (SELECT person_visits.pizzeria_id FROM person_visits
    JOIN menu ON person_visits.pizzeria_id = menu.pizzeria_id
    JOIN person ON person_visits.person_id = person.id
    WHERE person.name = 'Dmitriy' AND NOT visit_date = '2022-01-08' AND menu.price < 800), '2022-01-08');
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;