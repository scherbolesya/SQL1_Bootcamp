---SHOW TRANSACTION ISOLATION LEVEL; read committed
---На этом уровне изоляции транзакция может видеть только данные, 
---которые были зафиксированы другими транзакциями. 
---Грязные чтения запрещены, но неповторяющиеся чтения и 
---фантомные чтения все еще могут происходить.

-- Session #1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #1
COMMIT;

-- Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';