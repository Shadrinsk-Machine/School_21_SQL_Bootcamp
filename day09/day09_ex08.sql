CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop integer default 10)
RETURNS TABLE (answer bigint) AS $$
    WITH RECURSIVE fib (prev, num) AS (
        SELECT 0, 1
        UNION ALL
        SELECT num, prev + num
        FROM fib
        WHERE num < pstop
    )
    SELECT prev
    FROM fib;
$$ LANGUAGE sql;