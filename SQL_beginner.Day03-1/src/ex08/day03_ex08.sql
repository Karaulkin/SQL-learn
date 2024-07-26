insert into menu (id, pizzeria_id, pizza_name, price)
values ((SELECT max(id) + 1 FROM menu),
        (SELECT pizzeria.id FROM pizzeria
            WHERE pizzeria.name = 'Dominos'),
        'sicilian pizza',
        '900');
/*
select max(id) from menu;

DELETE FROM menu
WHERE id = 20;

 */
