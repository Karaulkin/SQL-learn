SELECT person.address as address,
       pizzeria.name as name,
       count(*)
FROM person_order
    inner join menu on person_order.menu_id = menu.id
    inner join person on person_order.person_id = person.id
    inner join pizzeria on menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name, person.address
order by person.address, pizzeria.name;