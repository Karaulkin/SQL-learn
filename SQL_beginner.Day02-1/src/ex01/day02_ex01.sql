SELECT data::date AS missing_data
FROM (SELECT person_visits.visit_date
      FROM person_visits
      WHERE person_id IN (1,2)) AS person_visits_sorted
RIGHT JOIN generate_series('2022-01-01'::timestamp, '2022-01-10', '1 day') AS data
ON visit_date = data
WHERE person_visits_sorted.visit_date IS NULL
ORDER BY 1;