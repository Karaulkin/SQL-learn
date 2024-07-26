SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYSE
SELECT menu.pizza_name, pizzeria.name
FROM menu
    INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id;
