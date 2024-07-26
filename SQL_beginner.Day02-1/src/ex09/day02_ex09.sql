WITH sorted_female AS (
    SELECT * FROM person
             JOIN public.person_order po on person.id = po.person_id
             WHERE person.gender = 'female'
)

SELECT sorted_female.name
FROM sorted_female
JOIN menu
    ON menu_id = menu.id
WHERE menu.pizza_name = 'pepperoni pizza'
    INTERSECT
SELECT sorted_female.name
FROM sorted_female
JOIN menu
    ON menu_id = menu.id
WHERE menu.pizza_name = 'cheese pizza'
ORDER BY 1;