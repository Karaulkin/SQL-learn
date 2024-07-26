WITH tables AS
    (SELECT pizzeria.name AS pizzeria_name, person.gender,  person_order.person_id
     FROM person
     INNER JOIN person_order ON person.id = person_order.person_id
     INNER JOIN menu ON person_order.menu_id = menu.id
     INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id),
male_table AS
    (SELECT pizzeria_name
     FROM tables WHERE tables.gender = 'male'),
female_table AS
    (SELECT pizzeria_name
     FROM tables WHERE tables.gender = 'female')

(SELECT pizzeria_name
 FROM female_table
 EXCEPT
 SELECT pizzeria_name
 FROM male_table)
UNION
(SELECT pizzeria_name
 FROM male_table
 EXCEPT
 SELECT pizzeria_name
 FROM female_table)
ORDER BY pizzeria_name


