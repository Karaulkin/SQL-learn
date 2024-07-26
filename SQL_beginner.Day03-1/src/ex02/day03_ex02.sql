SELECT menu.pizza_name,
       menu.price,
       pizzeria.name
FROM (SELECT id as menu_id
        FROM menu
        EXCEPT
    SELECT person_order.menu_id
    FROM person_order) AS sorted_menu
INNER JOIN menu ON  menu.id = sorted_menu.menu_id
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY 1, 2;

