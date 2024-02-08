SELECT p_o.order_date AS order_date,
       person.name || ' (age:' || age || ')' AS person_information
FROM person_order AS p_o (po_id, id, menu_id, order_date)
NATURAL JOIN person
ORDER BY order_date ASC,
         person_information ASC