SELECT COALESCE(person.name, '-') AS person_name,
       new_table.visit_date AS visit_date,
       COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM person
FULL JOIN
  (SELECT *
   FROM person_visits
   WHERE person_visits.visit_date BETWEEN '2022-01-01' AND '2022-01-03') new_table ON person.id = new_table.person_id
FULL JOIN pizzeria ON new_table.pizzeria_id = pizzeria.id
ORDER BY person_name,
         visit_date,
         pizzeria_name;