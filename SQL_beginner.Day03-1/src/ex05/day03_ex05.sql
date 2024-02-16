WITH visits_Andrey AS
  (SELECT DISTINCT pi.name AS pizzeria_name
   FROM person_visits pv
   JOIN
     (SELECT *
      FROM person p
      WHERE p.name = 'Andrey') visit_Andrey ON pv.person_id = visit_Andrey.id
   JOIN pizzeria pi ON pv.pizzeria_id = pi.id),
     
	 orders_Andrey AS
  (SELECT DISTINCT pi.name AS pizzeria_name
   FROM person_order po
   JOIN
     (SELECT *
      FROM person p
      WHERE p.name = 'Andrey') order_Andrey ON po.person_id = order_Andrey.id
   JOIN menu m ON po.menu_id = m.id
   JOIN pizzeria pi ON m.pizzeria_id = pi.id)

SELECT pizzeria_name
FROM visits_Andrey

EXCEPT

SELECT pizzeria_name
FROM orders_Andrey;