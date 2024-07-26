CREATE VIEW person AS
SELECT id,
       coalesce(name, 'not defined') as name,
       coalesce(lastname, 'not defined') as lastname
FROM public."user";

CREATE VIEW person_balance AS
SELECT coalesce(person.name, 'not defined') AS name,
       coalesce(person.lastname, 'not defined') AS lastname,
       balance.type AS type,
       SUM(balance.money) AS volume,
       balance.currency_id AS currency_id
FROM balance
FULL JOIN person ON balance.user_id = person.id
GROUP BY person.name, person.lastname, balance.type, balance.currency_id;

CREATE VIEW balance_type AS
SELECT currency.id as id,
       currency.name as currency_name,
       currency.rate_to_usd as last_rate_to_usd
FROM (
    SELECT id, MAX(updated) as last_time
    FROM currency
    GROUP BY id
) AS currency_last_time
INNER JOIN currency ON
    currency_last_time.last_time = currency.updated
    AND currency_last_time.id = currency.id;


SELECT coalesce(person_balance.name, 'not defined') as name,
       coalesce(person_balance.lastname, 'not defined') as lastname,
       person_balance.type as type,
       person_balance.volume as volume,
       coalesce(balance_type.currency_name, 'not defined') as currency_name,
       coalesce(balance_type.last_rate_to_usd, 1) as last_rate_to_usd,
       (person_balance.volume * coalesce(balance_type.last_rate_to_usd, 1)) as total_volume_in_usd
FROM person_balance
    full join  balance_type on balance_type.id = person_balance.currency_id
ORDER BY
	person_balance.name DESC,
	person_balance.lastname ASC,
	person_balance.type ASC;

DROP VIEW IF EXISTS person CASCADE;
DROP VIEW IF EXISTS person_balance;
DROP VIEW IF EXISTS balance_type;





