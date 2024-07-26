SELECT menu.pizza_name,
       menu.price,
       pizzeria.name AS pizzeria_name,
       person_visits.visit_date
FROM menu
    INNER JOIN pizzeria on pizzeria.id = menu.pizzeria_id
    INNER JOIN person_visits on pizzeria.id = person_visits.pizzeria_id
    INNER JOIN person on person_visits.person_id = person.id
-- Kate
-- in range 800 and 1000
WHERE menu.price
    BETWEEN 800 AND 1000
AND person.name = 'Kate'
ORDER BY 1, 2, 3;
