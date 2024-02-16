SET enable_seqscan TO OFF;   --отключение последовательного сканирование строк
EXPLAIN ANALYZE   --план исполнение запроса со стороны базы
SELECT pizza_name, name AS pizzeria_name
FROM menu
JOIN pizzeria ON pizzeria.id = pizzeria_id;