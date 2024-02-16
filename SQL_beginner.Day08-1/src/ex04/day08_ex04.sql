---SERIALIZABLE
---Это самый высокий уровень изоляции, 
---который обеспечивает строгую изоляцию транзакций. 
---Это гарантирует, что транзакции полностью изолированы друг от друга,
---а параллельные транзакции ведут себя так, как будто они выполняются 
---последовательно. Он предотвращает грязные чтения, неповторимые чтения 
---и фантомные чтения.

-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;

-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';