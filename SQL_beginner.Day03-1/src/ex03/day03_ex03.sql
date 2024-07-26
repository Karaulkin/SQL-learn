WITH tables AS
    (SELECT pizzeria.name AS pizzeria_name, person.gender
     FROM person
     INNER JOIN person_visits ON person.id = person_visits.person_id
     INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id),
male_table AS
    (SELECT pizzeria_name
     FROM tables WHERE tables.gender = 'male'),
female_table AS
    (SELECT pizzeria_name
     FROM tables WHERE tables.gender = 'female')

(SELECT pizzeria_name
    FROM male_table
EXCEPT ALL              -- ALL не убирает дублирующие строки
SELECT pizzeria_name
    FROM female_table)
UNION ALL -- Добавить результат не убирая дубликат (OR)
(SELECT pizzeria_name
    FROM female_table
EXCEPT ALL              -- ALL не убирает дублирующие строки
SELECT pizzeria_name
    FROM male_table)
