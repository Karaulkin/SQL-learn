WITH person_sorted AS (
    SELECT * from person
        JOIN person_order ON person_order.person_id = person.id
            WHERE person.gender = 'male'
                 AND (person.address in ('Samara', 'Moscow'))
)

SELECT person_sorted.name FROM person_sorted
JOIN menu ON menu.id = person_sorted.menu_id
WHERE menu.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY 1 DESC;