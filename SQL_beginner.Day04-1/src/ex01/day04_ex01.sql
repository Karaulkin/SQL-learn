(SELECT v_personal_female.name AS name FROM v_personal_female)
UNION DISTINCT
(SELECT v_personal_male.name AS name FROM v_personal_male)
ORDER BY name;
