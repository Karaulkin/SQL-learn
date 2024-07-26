WITH data AS (
    -- временные набор данных (CTE)
    SELECT data::date
    FROM generate_series('2022-01-01'::timestamp, '2022-01-10', '1 day') AS data)

SELECT data AS missing_data
FROM (SELECT person_visits.visit_date
      FROM person_visits
      WHERE person_id IN (1,2)) AS person_visits_sorted
RIGHT JOIN data
        ON person_visits_sorted.visit_date = data
           WHERE person_visits_sorted.visit_date IS NULL
ORDER BY missing_data;