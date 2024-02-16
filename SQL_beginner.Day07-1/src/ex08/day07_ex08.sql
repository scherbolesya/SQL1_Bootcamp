SELECT
	address,
	pizzeria.name,
	COUNT(person_order.id)
FROM person_order
	JOIN person ON person.id = person_id
	JOIN menu ON menu.id = menu_id
	JOIN pizzeria ON pizzeria.id = pizzeria_id
GROUP BY address, pizzeria.name 
ORDER BY address, name;