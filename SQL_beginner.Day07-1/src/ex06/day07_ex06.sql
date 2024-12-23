SELECT pizzeria.name AS name,
       count(*) AS count_of_orders,
       round(avg(menu.price), 2) AS average_price,
       max(menu.price) AS max_price,
       min(menu.price) AS min_price
FROM person_order
    INNER JOIN menu ON person_order.menu_id = menu.id
    INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY name;