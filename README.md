# dbops-project
Исходный репозиторий для выполнения проекта дисциплины "DBOps"

Создание новой БД и пользователя:
 
CREATE DATABASE store;
CREATE USER test_user WITH PASSWORD 'password';
GRANT ALL privileges ON DATABASE store TO test_user;
 
 
Запрос какое количество сосисок было продано за каждый день предыдущей недели:
 
SELECT
    orders.date_created AS order_date,
    SUM(order_product.quantity) AS number_of_sausages
FROM
    orders
JOIN
    order_product ON order_id = orders.id
WHERE
    orders.status = 'shipped'
    AND orders.date_created > NOW() - INTERVAL '7 DAY'
GROUP BY
    orders.date_created
ORDER BY
    orders.date_created;
 
 
Если нужно выбрать записи из прошлой недели, а не за истекшие 7 дней, интервал выборки указать так:
 
    date_created >= date_trunc('week', CURRENT_DATE) - INTERVAL '7 days'
    AND date_created < date_trunc('week', CURRENT_DATE)
