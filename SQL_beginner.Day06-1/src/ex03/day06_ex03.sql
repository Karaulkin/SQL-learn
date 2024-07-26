CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);

set enable_seqscan to off;

EXPLAIN ANALYZE
SELECT discount
FROM person_discounts
    INNER JOIN pizzeria ON person_discounts.pizzeria_id = pizzeria.id
WHERE person_id = 4 OR pizzeria_id = 2;

-- SELECT * from pg_indexes;

-- DROP INDEX idx_person_discounts_unique;
