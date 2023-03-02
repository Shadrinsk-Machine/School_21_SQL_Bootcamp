INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT generate AS id, person.id AS person_id, (SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id, '2022-02-25' AS order_date
FROM generate_series((SELECT max(id) + 1 FROM person_order), (SELECT max(id) FROM person) + (SELECT max(id) FROM person_order)) AS generate
JOIN person ON person.id = generate - (SELECT max(id) FROM person_order)