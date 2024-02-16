CREATE OR REPLACE FUNCTION fnc_fibonacci(sstop integer DEFAULT 10) RETURNS TABLE(NUM integer) AS $$
	WITH RECURSIVE recursia AS (
		SELECT
			0 AS value1,
			1 AS value2
		UNION ALL
		SELECT
			value2 AS value1,
			value1 + value2 AS value2
		FROM recursia
		WHERE value2 < sstop
	)
	SELECT value1 FROM recursia;
$$ LANGUAGE SQL;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();