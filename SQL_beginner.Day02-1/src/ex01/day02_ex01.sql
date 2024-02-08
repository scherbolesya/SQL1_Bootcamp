SELECT missing_day::date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS missing_day
LEFT JOIN
  (SELECT visit_date
   FROM person_visits
   WHERE person_id = 1
     OR person_id = 2 ) AS filter_table ON missing_day = visit_date
WHERE visit_date IS NULL;