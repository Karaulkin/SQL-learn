insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH balance_with_date_in_cur AS (
SELECT
    user_id,
    money,
    currency_id,
    CASE
        WHEN (SELECT MAX(currency.updated) FROM currency WHERE balance.currency_id = id AND updated <= balance.updated) IS NOT NULL
            THEN (SELECT MAX(currency.updated) FROM currency WHERE balance.currency_id = id AND updated <= balance.updated)
        ELSE (SELECT MIN(currency.updated) FROM currency WHERE balance.currency_id = id AND updated > balance.updated)
    END AS updated
FROM
    balance
)

SELECT
    COALESCE("user".name, 'not defined') AS name,
    COALESCE("user".lastname, 'not defined') AS lastname,
    currency.name AS currency_name,
    (bwdic.money * currency.rate_to_usd) AS currency_in_usd
FROM
    balance_with_date_in_cur bwdic
        JOIN currency ON (bwdic.updated = currency.updated AND bwdic.currency_id = currency.id)
        LEFT JOIN public."user" ON bwdic.user_id = "user".id
ORDER BY
    name DESC,
    lastname,
    currency_name;