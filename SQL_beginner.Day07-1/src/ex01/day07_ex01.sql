SELECT name, COUNT(person_visits.id) AS count_of_visits
FROM person_visits
JOIN person ON person.id = person_visits.person_id
GROUP BY name, person_id
ORDER BY count_of_visits DESC, name
LIMIT 4;