SELECT name, rating
    FROM pizzeria
LEFT JOIN person_visits
ON pizzeria.id = person_visits.pizzeria_id
    -- без пересечений
WHERE person_visits.id is null;