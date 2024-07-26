COMMENT ON TABLE person_discounts IS 'таблица хранит скидку пользователя к нужной пицерии';
COMMENT ON COLUMN person_discounts.id IS 'уникальный ключ данной таблицы';
COMMENT ON COLUMN person_discounts.person_id IS 'person_id клиента из таблицы person.id';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'pizzeria_id пицерии из таблицы pizzeria.id';
COMMENT ON COLUMN person_discounts.discount IS 'скидка в значении с плавающей точкой';