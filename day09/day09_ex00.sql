CREATE TABLE person_audit (
	created timestamp with time zone default NOW() NOT NULL,
  	type_event char(1) default 'I' NOT NULL,
  	row_id BIGINT NOT NULL,
  	name varchar NOT NULL,
  	age integer,
  	gender varchar,
  	address varchar
	constraint ch_type_event check (type_event = 'I' OR type_event = 'U' OR type_event = 'D')
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $trg_person_insert_audit$
    BEGIN
        IF (TG_OP = 'INSERT') THEN
            INSERT INTO person_audit
            SELECT NOW(), 'I', NEW.*;
        END IF;
        RETURN NULL;
    END;

$trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();
INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');