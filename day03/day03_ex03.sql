WITH woman_visits AS (SELECT pizzeria.name AS pizzeria_name FROM pizzeria
	JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person_visits.person_id = person.id
	WHERE person.gender= 'female'),
	man_visits AS (SELECT pizzeria.name FROM pizzeria
	JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person_visits.person_id = person.id
	WHERE person.gender= 'male'),
	woman_differences AS (SELECT *
	          FROM woman_visits
	          EXCEPT ALL
	          SELECT *
	          FROM man_visits),
	man_differences AS (SELECT *
	          FROM man_visits
	          EXCEPT ALL
	          SELECT *
	          FROM woman_visits)
SELECT *
FROM woman_differences
UNION
SELECT *
FROM man_differences
ORDER BY pizzeria_name;