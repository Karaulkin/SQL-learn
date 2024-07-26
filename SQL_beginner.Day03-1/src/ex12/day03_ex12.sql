WITH new_order
    AS (SELECT count_persons + (SELECT max(id) FROM person_order) AS id,
            person.id AS person_id,
            (SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id,
            CAST('2022-02-25' AS DATE) AS order_date
            FROM person
            INNER JOIN generate_series(1, (SELECT COUNT(id) FROM person)) AS count_persons
            ON person.id = count_persons)

INSERT
INTO person_order (id, person_id, menu_id, order_date)
SELECT *
FROM new_order;