SELECT p.name AS non_existent_pizzeria
    FROM pizzeria AS p
WHERE p.id
NOT IN (SELECT pizzeria_id
            FROM person_visits);

SELECT p.name AS non_existent_pizzeria
    FROM pizzeria AS p
WHERE NOT EXISTS(SELECT pizzeria_id FROM person_visits
                                    WHERE p.id = pizzeria_id);