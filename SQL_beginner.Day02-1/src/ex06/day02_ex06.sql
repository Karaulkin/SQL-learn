SELECT menu.pizza_name,
       pizzeria.name AS pizzeria_name
FROM (SELECT * FROM person
               WHERE person.name in ('Denis', 'Anna'))
    AS sorted_person
INNER JOIN person_order
    ON person_id = sorted_person.id
INNER JOIN menu
    ON menu.id = person_order.menu_id
INNER JOIN pizzeria
    ON pizzeria_id = pizzeria.id
ORDER BY 1, 2;