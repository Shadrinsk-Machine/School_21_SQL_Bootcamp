WITH tmp AS (SELECT DISTINCT point1
             FROM nodes),
     tmp1 AS (SELECT ((SELECT cost FROM nodes WHERE point1 = 'a' AND point2 = tmp.point1) +
                      (SELECT cost FROM nodes WHERE point1 = tmp.point1 AND point2 = nd.point1) +
                      (SELECT cost FROM nodes WHERE point1 = nd.point1 AND point2 = nd.point2) +
                      (SELECT cost FROM nodes WHERE point1 = nd.point2 AND point2 = 'a')) AS total_cost,
                      (SELECT CONCAT('{a', ',', tmp.point1, ',', nd.point1, ',', nd.point2, ',a}') AS tour)
              FROM tmp
              JOIN nodes nd ON NOT nd.point1 = tmp.point1
              WHERE NOT tmp.point1 = nd.point1
              AND NOT tmp.point1 = nd.point2
              AND NOT tmp.point1 = 'a'
              AND NOT 'a' = nd.point2
              AND NOT nd.point1 = 'a'
              ORDER BY 1, 2)
SELECT *
FROM tmp1
WHERE total_cost = (SELECT MIN(total_cost) FROM tmp1) OR total_cost = (SELECT MAX(total_cost) FROM tmp1);