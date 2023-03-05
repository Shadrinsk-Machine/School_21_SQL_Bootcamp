-- session #1
BEGIN TRANSACTION;

-- session #2
BEGIN TRANSACTION;

-- session #1
SELECT SUM(rating) FROM pizzeria;

-- session #2
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';
COMMIT;

-- session #1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;

-- session #2
SELECT SUM(rating) FROM pizzeria;