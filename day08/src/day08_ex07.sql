-- session #1
BEGIN TRANSACTION;

-- session #2
BEGIN TRANSACTION;

-- session #1
UPDATE pizzeria SET rating = 1.5 WHERE id = 1;

-- session #2
UPDATE pizzeria SET rating = 3.5 WHERE id = 2;

-- session #1
UPDATE pizzeria SET rating = 2.5 WHERE id = 2;

-- session #2
UPDATE pizzeria SET rating = 0.5 WHERE id = 1;

-- session #1
COMMIT;

-- session #2
COMMIT;