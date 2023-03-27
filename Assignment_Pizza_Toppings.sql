CREATE TABLE Pizza_Toppings (topping_name VARCHAR(15) PRIMARY KEY, ingredient_cost SMALLMONEY);

INSERT INTO Pizza_Toppings (topping_name, ingredient_cost) VALUES
	('Pepperoni', 0.50),
	('Sausage', 0.70),
	('Chicken',	0.55),
	('Extra Cheese', 0.40);

SELECT * FROM Pizza_Toppings

SELECT CONCAT_WS(',', pt1.topping_name, pt2.topping_name, pt3.topping_name) AS toppings,
		SUM(pt1.ingredient_cost + pt2.ingredient_cost + pt3.ingredient_cost) AS total_cost
FROM Pizza_Toppings pt1
JOIN Pizza_Toppings pt2 ON pt1.topping_name < pt2.topping_name
JOIN Pizza_Toppings pt3 ON pt2.topping_name < pt3.topping_name
GROUP BY pt1.topping_name, pt2.topping_name, pt3.topping_name
ORDER BY total_cost DESC;