CREATE VIEW ALL_WORKERS AS
SELECT first_name, last_name, age, first_day AS start_date
FROM WORKERS_FACTORY_1
WHERE last_day IS NULL
UNION ALL
SELECT first_name, last_name, NULL AS age, start_date
FROM WORKERS_FACTORY_2
WHERE end_date IS NULL
ORDER BY start_date DESC;




CREATE VIEW ALL_WORKERS_ELAPSED AS
SELECT first_name, last_name, age, start_date, SYSDATE - start_date AS  jours_écoulés
FROM ALL_WORKERS;

CREATE VIEW BEST_SUPPLIERS AS
SELECT supplier_id, SUM(quantity) AS total_pieces_delivered
FROM SUPPLIERS_BRING_TO_FACTORY_1
GROUP BY supplier_id
HAVING SUM(quantity) > 1000
ORDER BY total_pieces_delivered DESC;

CREATE VIEW ROBOTS_FACTORIES AS
SELECT r.id AS robot_id, rf.factory_id AS factory_id
FROM ROBOTS r
JOIN ROBOTS_FROM_FACTORY rf ON r.id = rf.robot_id;



