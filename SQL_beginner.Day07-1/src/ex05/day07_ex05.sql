SELECT DISTINCT person.name AS name
FROM person
    INNER JOIN person_order ON person.id = person_order.person_id
ORDER BY name;