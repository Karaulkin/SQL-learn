(SELECT pizzeria.name AS name,
        count(*),
        'order' AS action_type
 FROM menu
     INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
     INNER JOIN person_order ON menu.id = person_order.menu_id
 GROUP BY pizzeria.name
 ORDER BY 2 DESC
 LIMIT 3)
UNION
(SELECT pizzeria.name AS name,
 count(*),
 'visit' AS action_type
 FROM pizzeria
     INNER JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
 GROUP BY pizzeria.name
 ORDER BY 2 DESC
 LIMIT 3)
ORDER BY 3, 2 DESC;