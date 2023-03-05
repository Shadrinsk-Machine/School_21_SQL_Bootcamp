WITH cte AS (
	SELECT name, COUNT(person_id) AS COUNT
	FROM person
         JOIN person_visits ON person_visits.person_id = person.id
	GROUP BY name
)
SELECT person.name, cte.count
FROM person
JOIN cte ON cte.name = person.name AND cte.count > 3;