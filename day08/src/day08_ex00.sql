-- session #1
BEGIN TRANSACTION;
UPDATE pizzeria SET rating = 5 WHERE NAME = 'Pizza Hut';
SELECT * FROM pizzeria WHERE NAME = 'Pizza Hut';

-- session #2
SELECT * FROM pizzeria WHERE NAME = 'Pizza Hut';

-- session #1
COMMIT;

-- session #2
SELECT * FROM pizzeria WHERE NAME = 'Pizza Hut';