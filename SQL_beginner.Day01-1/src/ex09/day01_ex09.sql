SELECT pizzeria.name
FROM pizzeria
WHERE pizzeria.name not in
    (SELECT DISTINCT pizzeria.name
     FROM pizzeria
     JOIN person_visits ON person_visits.pizzeria_id=pizzeria.id)

SELECT pizzeria.name
FROM pizzeria
WHERE NOT EXISTS
    (SELECT 1
     FROM person_visits
     WHERE pizzeria.id=person_visits.pizzeria_id)