WITH filter_visits AS
  (SELECT person_visits.visit_date
   FROM person_visits
   WHERE person_visits.person_id = 1
     OR person_visits.person_id = 2),
     filter_dates AS
  (SELECT DAY::date AS missing_date
   FROM GENERATE_SERIES(timestamp '2022-01-01', '2022-01-10', '1 day') AS DAY)
SELECT filter_dates.missing_date
FROM filter_dates
LEFT JOIN filter_visits ON filter_dates.missing_date = filter_visits.visit_date
WHERE visit_date IS NULL
ORDER BY missing_date;