ALTER TABLE person_discounts
    ADD CONSTRAINT ch_nn_person_id CHECK ( person_id is NOT NULL );
ALTER TABLE person_discounts
    ADD CONSTRAINT ch_nn_pizzeria_id CHECK ( pizzeria_id is NOT NULL );
ALTER TABLE person_discounts
    ADD CONSTRAINT ch_nn_discount CHECK ( discount is NOT NULL );
ALTER TABLE person_discounts
    ALTER COLUMN discount set DEFAULT 0;
ALTER TABLE person_discounts
    ADD CONSTRAINT ch_range_discount CHECK ( discount BETWEEN 0 and 100);



