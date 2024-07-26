SELECT person_order.order_date AS order_date,
p.name || ' (age:' || p.age || ')' AS person_information
    FROM person_order AS person_order(non_used_id, id, menu_id, order_date)
NATURAL JOIN person p
ORDER BY 1, 2;