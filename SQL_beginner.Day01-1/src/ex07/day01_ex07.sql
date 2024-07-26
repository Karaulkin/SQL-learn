SELECT person_order.order_date AS order_date,
p.name || ' (age:' || p.age || ')' AS person_information
    FROM person_order
JOIN person p on person_order.person_id = p.id
ORDER BY 1, 2;

