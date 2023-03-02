CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(IN pperson varchar default 'Dmitriy', IN pprice numeric default 500, IN pdate date default '2022-01-08')
RETURNS TABLE (name varchar) AS $$
    BEGIN
        RETURN QUERY (
            SELECT pizzeria.name
            FROM menu
            JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
            JOIN person_visits ON menu.pizzeria_id = person_visits.pizzeria_id
            JOIN person ON person.id = person_visits.person_id
            WHERE person.name = pperson AND menu.price < pprice AND person_visits.visit_date = pdate
        );
    END;
$$ LANGUAGE plpgsql;