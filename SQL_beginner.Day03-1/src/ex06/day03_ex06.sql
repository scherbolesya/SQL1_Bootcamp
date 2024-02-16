WITH main AS
  (SELECT menu.pizza_name,
          pizzeria.name,
          menu.price,
          pizzeria.id
   FROM menu
   JOIN pizzeria ON menu.pizzeria_id = pizzeria.id)
   
SELECT copy_main.pizza_name,
       copy_main.name AS pizzeria_name_1,
       main.name AS pizzeria_name_2,
       copy_main.price
FROM
  (SELECT *
   FROM main) copy_main
JOIN main ON copy_main.price = main.price
AND copy_main.pizza_name = main.pizza_name
AND copy_main.id > main.id
ORDER BY 1;