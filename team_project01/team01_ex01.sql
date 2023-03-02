INSERT INTO currency
VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency
VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION t1(cur_date timestamp, cur_id integer)
RETURNS TABLE (rate_to_usd numeric) AS $$
    BEGIN
        RETURN QUERY (
            SELECT max_date.rate_to_usd
            FROM (SELECT * FROM currency WHERE currency.id = cur_id AND updated < cur_date) AS max_date
            WHERE updated = (SELECT MAX(updated) FROM (SELECT * FROM currency WHERE updated < cur_date AND currency.id = cur_id) AS max_date)
        );
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION t2(cur_date timestamp, cur_id integer)
RETURNS TABLE (rate_to_usd numeric) AS $$
    BEGIN
        RETURN QUERY (
            SELECT min_date.rate_to_usd
            FROM (SELECT * FROM currency WHERE currency.id = cur_id AND updated > cur_date) AS min_date
            WHERE updated = (SELECT MIN(updated) FROM (SELECT * FROM currency WHERE updated > cur_date AND currency.id = cur_id) AS min_date)
        );
    END;
$$ LANGUAGE plpgsql;

WITH tmp AS (SELECT COALESCE("user".name, 'not defined') AS name, COALESCE("user".lastname, 'not defined') AS lastname,
             currency.name AS currency_name,
            (CASE WHEN (SELECT COUNT(*) FROM t1(balance.updated, balance.currency_id)) = 1
             THEN (SELECT rate_to_usd FROM t1(balance.updated, balance.currency_id))
             ELSE (SELECT rate_to_usd FROM t2(balance.updated, balance.currency_id))
             END) * balance.money AS currency_in_usd
             FROM "user"
             FULL JOIN balance ON "user".id = balance.user_id
             JOIN currency ON currency.id = balance.currency_id)
SELECT DISTINCT name, lastname, currency_name, currency_in_usd
FROM tmp
ORDER BY name DESC, lastname, currency_name;