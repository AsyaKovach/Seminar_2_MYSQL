CREATE DATABASE  IF NOT EXISTS seminar2; -- создание бд с именем seminar2,
USE seminar2;

-- Task 1 Создание таблицы со sales
DROP TABLE IF EXISTS sales; -- Удаляем стурую версию таблицы со всеми полями 
CREATE TABLE  sales
(
id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
 order_date DATE,
 count_product INT DEFAULT '0'
);

-- Заполнение таблицы
INSERT INTO sales (order_date, count_product)
VALUES 
('2023-06-01', 55),
('2023-06-02', 90),
('2023-06-03', 156),
('2023-06-04', 277),
('2023-06-05', 999);

-- Task2Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
SELECT 
	id AS 'id заказа',
	IF (count_product < 100, 'Маленький заказ', 
		IF (count_product BETWEEN 100 AND 300, 'Средний заказ', 'Большой заказ')
	) AS 'Тип заказа'	
FROM sales;


-- Task3 Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
 id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
 employee_id VARCHAR(5) NOT NULL UNIQUE DEFAULT 'e00',
 amount FLOAT(7,2) NOT NULL DEFAULT '0.00',
    order_status VARCHAR(15) NOT NULL DEFAULT 'OPEN'
);
INSERT INTO orders (employee_id, amount, order_status)
VALUES 
('e03', 15.00, 'OPEN'),
('e01', 55.50, 'OPEN'),
('e05', 100.99, 'CLOSED'),
('e02', 77.18, 'OPEN'),
('e04', 9.99, 'CANCELLED');


SELECT 
 employee_id AS 'Номер заказа',
 amount AS 'Сумма заказа',
    CASE order_status 
  WHEN 'OPEN' THEN 'Order is in open state'
  WHEN 'CLOSED' THEN 'Order is closed'
  WHEN 'CANCELLED' THEN 'Order is cancelled'
 END AS 'full_order_status' 
FROM orders;




