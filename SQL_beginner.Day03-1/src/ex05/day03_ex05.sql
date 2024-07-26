WITH andrey_order AS (SELECT pizzeria.name AS pizzeria_name
                      FROM person
                        INNER JOIN person_order ON person.id = person_order.person_id
                        INNER JOIN menu ON person_order.menu_id = menu.id
                        INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
                      WHERE person.name = 'Andrey'),
    andrey_visit AS (SELECT pizzeria.name AS pizzeria_name
                     FROM person
                        INNER JOIN person_visits ON person.id = person_visits.person_id
                        INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
                     WHERE person.name = 'Andrey')
SELECT pizzeria_name
FROM andrey_visit
EXCEPT
SELECT pizzeria_name
FROM andrey_order;