SELECT address,
       round(max(cast(age as numeric)) - min(cast(age as numeric)) / max(cast(age as numeric)), 2) as formula,
       round(avg(cast(age as numeric)), 2) as average,
       round(max(cast(age as numeric)) - min(cast(age as numeric)) / max(cast(age as numeric)), 2) >= round(avg(cast(age as numeric)), 2) as comparison
FROM person
GROUP BY address
ORDER BY 1;