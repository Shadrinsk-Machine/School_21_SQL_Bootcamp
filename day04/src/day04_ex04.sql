CREATE VIEW v_symmetric_union AS
    WITH R AS (SELECT person_id
                 FROM person_visits
                 WHERE visit_date = '2022-01-02'),
	S AS (SELECT person_id
	        FROM person_visits
	        WHERE visit_date = '2022-01-06'),
	R_S AS (SELECT person_id
	        FROM R
	        EXCEPT
	        SELECT person_id
	        FROM S)
	SELECT person_id
	FROM R_S
	UNION ALL
	SELECT person_id
	FROM S
ORDER BY person_id;