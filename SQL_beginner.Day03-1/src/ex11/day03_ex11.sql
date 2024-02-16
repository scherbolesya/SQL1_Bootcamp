UPDATE menu
SET price = round(price * 0.9)
WHERE pizza_name = 'greek pizza';