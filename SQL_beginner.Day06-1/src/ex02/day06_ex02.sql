SELECT person.name as name,
       menu.pizza_name as pizza_name,
       menu.price as price,
       (menu.price - menu.price * person_discounts.discount * 0.01) as discount_price,
        pizzeria.name as pizzeria_name
FROM person_order
         INNER JOIN menu ON person_order.menu_id = menu.id
         INNER JOIN person ON person.id = person_order.person_id
         INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
         INNER JOIN person_discounts
                    ON person_discounts.person_id = person.id AND person_discounts.pizzeria_id = menu.pizzeria_id
ORDER BY person.name, pizza_name

