CREATE TABLE graph
(
    point1 VARCHAR(1),
    point2 VARCHAR(1),
    cost SMALLINT
);

INSERT INTO graph (point1, point2, cost)
VALUES ('a', 'b', 10),
       ('b', 'a', 10),
       ('a', 'c', 15),
       ('c', 'a', 15),
       ('a', 'd', 20),
       ('d', 'a', 20),
       ('b', 'd', 25),
       ('d', 'b', 25),
       ('c', 'd', 30),
       ('d', 'c', 30),
       ('b', 'c', 35),
       ('c', 'b', 35);

CREATE VIEW table_a AS
(
WITH RECURSIVE path AS (
                        -- стартовая часть рекурсии
                        SELECT CAST(graph.point1 AS varchar) AS point,
                               graph.point2 AS next_point,
                               graph.cost AS total_coast
                        FROM graph
                        WHERE point1 = 'a'

                        UNION
                         -- рекурсивная часть
                        SELECT path.point || ',' || path.next_point AS point,
                               graph.point1                         AS next_point,
                               path.total_coast + graph.cost        AS total_coast
                        FROM path
                                 INNER JOIN graph
                                            ON graph.point2 = path.next_point
                        WHERE point NOT LIKE
                              '%' || graph.point2 || '%'
                        )

SELECT '{' || point || ',' || 'a' || '}' AS point, total_coast AS total
    FROM path
WHERE length(point) = 7 AND next_point = 'a'
);

SELECT total AS total_coast, point AS tour
FROM table_a
WHERE total = (SELECT MIN(total) FROM table_a)
ORDER BY 1, 2;