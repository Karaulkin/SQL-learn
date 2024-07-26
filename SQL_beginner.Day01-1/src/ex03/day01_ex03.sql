(SELECT order_date AS action_date, person_order.person_id AS person_id
 FROM person_order)
INTERSECT ALL
(SELECT visit_date AS action_date, person_visits.person_id AS person_id
FROM person_visits
)
ORDER BY  1 ASC, 2 DESC;



