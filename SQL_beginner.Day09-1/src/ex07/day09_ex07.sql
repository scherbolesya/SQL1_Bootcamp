---В PostgreSQL ключевое слово VARIADIC используется для определения параметра функции, 
---который принимает переменное количество аргументов указанного типа данных. 
---Это особенно полезно, когда вы хотите создать функции, которые могут принимать 
---гибкое количество аргументов.

CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[]) RETURNS numeric AS $$
    SELECT min(value) FROM unnest(arr) AS t(value);
$$ LANGUAGE SQL;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);