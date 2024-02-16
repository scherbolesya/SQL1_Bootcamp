---Этот уровень изоляции гарантирует, что в рамках одной и той же 
---транзакции запрос всегда будет возвращать один и тот же набор 
---результатов, даже если другие транзакции фиксируются. 
---Это предотвращает повторяющиеся чтения, но фантомные чтения все 
---еще могут происходить

-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; 
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
-- Session #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

-- Session #1
COMMIT;
-- Session #2
COMMIT;

-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';