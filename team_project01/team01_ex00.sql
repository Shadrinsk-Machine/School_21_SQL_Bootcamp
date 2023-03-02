WITH eur AS (SELECT *
             FROM currency
             WHERE rate_to_usd = (SELECT MAX(rate_to_usd) FROM currency WHERE name = 'EUR')
             ORDER BY rate_to_usd LIMIT 1),
    usd AS (SELECT *
            FROM currency
            WHERE rate_to_usd = (SELECT MAX(rate_to_usd) FROM currency WHERE name = 'USD')
            ORDER BY rate_to_usd LIMIT 1),
    jpy AS (SELECT *
            FROM currency
            WHERE rate_to_usd = (SELECT MAX(rate_to_usd) FROM currency WHERE name = 'JPY')
            ORDER BY rate_to_usd LIMIT 1),
    result AS (SELECT *
               FROM eur
               UNION
               SELECT *
               FROM usd
               UNION
               SELECT *
               FROM jpy),
	tmp AS (SELECT DISTINCT (CASE WHEN "user".name IS NULL
                             THEN 'not defined'
                             ELSE "user".name
                             END) AS name,
           (CASE WHEN "user".lastname IS NULL
            THEN 'not defined'
            ELSE "user".lastname
            END) AS lastname,
           balance.type,
           SUM(balance.money) AS volume,
           (CASE WHEN result.name IS NULL
            THEN 'not defined'
            ELSE result.name
            END) AS currency_name,
           (CASE WHEN result.rate_to_usd IS NULL
            THEN 1
            ELSE result.rate_to_usd
            END) AS last_rate_to_usd,
           (CASE WHEN result.rate_to_usd IS NULL
            THEN 1 * SUM(balance.money)
            ELSE result.rate_to_usd * SUM(balance.money)
            END) AS total_volume_in_usd
           FROM "user"
           FULL JOIN balance ON balance.user_id = "user".id
           FULL JOIN result ON balance.currency_id = result.id
           GROUP BY "user".name, "user".lastname, balance.type, result.name, result.rate_to_usd)
SELECT name, lastname, type, volume, currency_name, last_rate_to_usd, total_volume_in_usd
FROM tmp
ORDER BY name DESC, lastname, type;