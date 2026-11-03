-- =====================================================================
-- SQL საშინაო დავალება (MySQL 8)
-- სკრიპტი ეშვება თავიდან ბოლომდე ერთიანად.
-- =====================================================================

-- თავიდან გაშვებისთვის ძველ ბაზას ვშლით
DROP DATABASE IF EXISTS sql_homework;
CREATE DATABASE sql_homework;
USE sql_homework;

-- MySQL Workbench-ის "Safe Updates" რეჟიმი ბლოკავს UPDATE/DELETE-ს
-- არა-key სვეტით (მაგ. WHERE city = ...). ამიტომ ვთიშავთ:
SET SQL_SAFE_UPDATES = 0;


-- =====================================================================
-- ცხრილების შექმნა
-- =====================================================================

CREATE TABLE professors (
    id   INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE courses (
    id    INT PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

CREATE TABLE students (
    id        INT PRIMARY KEY,
    name      VARCHAR(50) NOT NULL,
    age       INT,
    city      VARCHAR(50),
    prof_id   INT NULL,
    course_id INT NULL,
    FOREIGN KEY (prof_id)   REFERENCES professors(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE sales (
    id           INT PRIMARY KEY,
    product_name VARCHAR(50),
    category     VARCHAR(50),
    city         VARCHAR(50),
    amount       DECIMAL(10, 2)
);

-- customers / products / orders გამოიყენება მე-9, მე-10 და მე-12 დავალებებში
CREATE TABLE customers (
    id   INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    age  INT
);

CREATE TABLE products (
    id       INT PRIMARY KEY,
    name     VARCHAR(50) NOT NULL,
    category VARCHAR(50),
    price    DECIMAL(10, 2)
);

CREATE TABLE orders (
    id          INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id  INT NOT NULL,
    quantity    INT NOT NULL,
    order_date  DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (product_id)  REFERENCES products(id)
);


-- =====================================================================
-- მონაცემები
-- =====================================================================

INSERT INTO professors (id, name) VALUES
(1, 'Beridze'),
(2, 'Kapanadze'),
(3, 'Lomidze'),
(4, 'Chikovani');          -- ამ პროფესორს სტუდენტი არ ჰყავს (RIGHT JOIN-ისთვის)

INSERT INTO courses (id, title) VALUES
(1, 'Databases'),
(2, 'Python'),
(3, 'Web Development'),
(4, 'Data Science');

INSERT INTO sales (id, product_name, category, city, amount) VALUES
(1,  'Laptop',     'Electronics', 'Tbilisi', 2500),
(2,  'Phone',      'Electronics', 'Tbilisi', 1200),
(3,  'Headphones', 'Electronics', 'Batumi',   150),
(4,  'TV',         'Electronics', 'Tbilisi', 1800),
(5,  'Tablet',     'Electronics', 'Kutaisi',  900),
(6,  'Sofa',       'Furniture',   'Tbilisi', 1500),
(7,  'Chair',      'Furniture',   'Batumi',   250),
(8,  'Desk',       'Furniture',   'Tbilisi',  400),
(9,  'Book',       'Books',       'Kutaisi',   30),
(10, 'Notebook',   'Books',       'Tbilisi',   15),
(11, 'Novel',      'Books',       'Batumi',    25),
(12, 'T-Shirt',    'Clothing',    'Tbilisi',   40),
(13, 'Jacket',     'Clothing',    'Batumi',   220),
(14, 'Shoes',      'Clothing',    'Kutaisi',  180),
(15, 'Wardrobe',   'Furniture',   'Kutaisi', 1100),
(16, 'Lamp',       'Furniture',   'Rustavi',   60);

INSERT INTO customers (id, name, city, age) VALUES
(1,  'Ana',    'Tbilisi', 22),
(2,  'Giorgi', 'Tbilisi', 28),
(3,  'Nika',   'Batumi',  35),
(4,  'Mariam', 'Tbilisi', 19),
(5,  'Luka',   'Kutaisi', 24),
(6,  'Tamar',  'Tbilisi', 31),
(7,  'Dato',   'Rustavi', 27),
(8,  'Salome', 'Batumi',  21),   -- შეკვეთა არ აქვს
(9,  'Levan',  'Tbilisi', 45),   -- შეკვეთა არ აქვს
(10, 'Natia',  'Tbilisi', 26);

INSERT INTO products (id, name, category, price) VALUES
(1,  'Laptop',       'Electronics', 2500),
(2,  'Phone',        'Electronics', 1200),
(3,  'Headphones',   'Electronics',  150),
(4,  'Tablet',       'Electronics',  900),
(5,  'Desk',         'Furniture',    400),
(6,  'Chair',        'Furniture',    250),
(7,  'Book',         'Books',         30),
(8,  'Lamp',         'Furniture',     60),
(9,  'Backpack',     'Accessories',  120),
(10, 'Coffee Maker', 'Kitchen',      350),
(11, 'Gaming PC',    'Computers',   3200);  -- ყველა Electronics-ზე ძვირი (ALL-ისთვის)

INSERT INTO orders (id, customer_id, product_id, quantity, order_date) VALUES
(1,  1, 1,  1, '2026-01-05'),
(2,  1, 3,  2, '2026-01-12'),
(3,  1, 7,  3, '2026-02-01'),
(4,  1, 8,  1, '2026-02-15'),
(5,  2, 2,  1, '2026-01-08'),
(6,  2, 7,  2, '2026-02-10'),
(7,  2, 9,  1, '2026-03-03'),
(8,  3, 6,  2, '2026-01-20'),
(9,  3, 8,  1, '2026-02-22'),
(10, 3, 7,  1, '2026-03-14'),
(11, 4, 4,  1, '2026-01-25'),
(12, 4, 7,  2, '2026-03-01'),
(13, 5, 11, 1, '2026-02-05'),
(14, 5, 3,  1, '2026-02-18'),
(15, 5, 10, 1, '2026-03-20'),
(16, 6, 5,  1, '2026-01-30'),
(17, 6, 6,  1, '2026-03-11'),
(18, 7, 7,  5, '2026-02-09'),
(19, 7, 8,  2, '2026-03-25'),
(20, 10, 2, 1, '2026-03-28');


-- =====================================================================
-- დავალება 2.1 — INSERT: 10+ სტუდენტი
-- (პირველ რიგში ვამატებთ, რომ დავალება 1-ს მონაცემები ჰქონდეს)
-- =====================================================================

INSERT INTO students (id, name, age, city, prof_id, course_id) VALUES
(1,  'Giorgi',  20, 'Tbilisi', 1,    1),
(2,  'Ana',     22, 'Batumi',  1,    2),
(3,  'Nika',    19, 'Kutaisi', 2,    1),
(4,  'Gvantsa', 24, 'Tbilisi', 2,    3),
(5,  'Luka',    27, 'Rustavi', NULL, 2),     -- პროფესორი არ ჰყავს
(6,  'Mariam',  18, 'Tbilisi', 3,    4),
(7,  'Gela',    30, 'Batumi',  3,    1),
(8,  'Tamar',   21, 'Kutaisi', NULL, NULL),  -- პროფესორი არ ჰყავს
(9,  'Dato',    26, 'Gori',    1,    3),
(10, 'Salome',  23, 'Tbilisi', 2,    2),
(11, 'Irakli',  17, 'Gori',    NULL, 4),
(12, 'Nino',    25, 'Telavi',  3,    3);


-- =====================================================================
-- დავალება 1 — SELECT, WHERE, LIKE, IN, BETWEEN
-- =====================================================================

-- 1. ყველა სტუდენტი
SELECT * FROM students;

-- 2. მხოლოდ name, age, city
SELECT name, age, city FROM students;

-- 3. ასაკი 18-დან 25-მდე (BETWEEN ორივე საზღვარს მოიცავს)
SELECT * FROM students
WHERE age BETWEEN 18 AND 25;

-- 4. Tbilisi, Batumi ან Kutaisi
SELECT * FROM students
WHERE city IN ('Tbilisi', 'Batumi', 'Kutaisi');

-- 5. სახელი იწყება G-ზე
SELECT * FROM students
WHERE name LIKE 'G%';

-- 6. ქალაქის სახელში არის ასო 'a'
SELECT * FROM students
WHERE city LIKE '%a%';


-- =====================================================================
-- დავალება 2 — UPDATE, DELETE
-- =====================================================================

-- 2. ერთ სტუდენტს ვუცვლით ქალაქს
UPDATE students
SET city = 'Tbilisi'
WHERE id = 2;

-- 3. რამდენიმე სტუდენტს ვუცვლით ასაკს
UPDATE students
SET age = age + 1
WHERE id IN (3, 6);

-- 4. ვშლით ერთ კონკრეტულ სტუდენტს
DELETE FROM students
WHERE id = 7;

-- 5. ვშლით Gori-ს ყველა სტუდენტს
DELETE FROM students
WHERE city = 'Gori';

SELECT * FROM students;   -- შედეგის შემოწმება


-- =====================================================================
-- დავალება 3 — აგრეგირების ფუნქციები
-- =====================================================================

-- students
SELECT COUNT(*) AS student_count FROM students;
SELECT AVG(age) AS average_age   FROM students;
SELECT MIN(age) AS youngest_age  FROM students;
SELECT MAX(age) AS oldest_age    FROM students;

-- sales
SELECT
    COUNT(*)    AS sales_count,
    SUM(amount) AS total_amount,
    AVG(amount) AS average_amount,
    MIN(amount) AS min_amount,
    MAX(amount) AS max_amount
FROM sales;


-- =====================================================================
-- დავალება 4 — GROUP BY
-- =====================================================================

-- 1. გაყიდვების რაოდენობა ქალაქების მიხედვით
SELECT city, COUNT(*) AS sales_count
FROM sales
GROUP BY city;

-- 2. გაყიდვების ჯამი ქალაქების მიხედვით
SELECT city, SUM(amount) AS total_amount
FROM sales
GROUP BY city;

-- 3. გაყიდვების რაოდენობა კატეგორიების მიხედვით
SELECT category, COUNT(*) AS sales_count
FROM sales
GROUP BY category;

-- 4. საშუალო გაყიდვა კატეგორიების მიხედვით
SELECT category, AVG(amount) AS average_amount
FROM sales
GROUP BY category;

-- 5. ყველაზე დიდი გაყიდვა თითოეულ ქალაქში
SELECT city, MAX(amount) AS max_amount
FROM sales
GROUP BY city;

-- 6. ყველაზე პატარა გაყიდვა თითოეულ ქალაქში
SELECT city, MIN(amount) AS min_amount
FROM sales
GROUP BY city;


-- =====================================================================
-- დავალება 5 — HAVING
-- =====================================================================

-- 1. ქალაქები, სადაც მინიმუმ 3 გაყიდვაა
SELECT city, COUNT(*) AS sales_count
FROM sales
GROUP BY city
HAVING COUNT(*) >= 3;

-- 2. კატეგორიები, სადაც ჯამი 5000-ზე მეტია
SELECT category, SUM(amount) AS total_amount
FROM sales
GROUP BY category
HAVING SUM(amount) > 5000;

-- 3. კატეგორიები, სადაც საშუალო გაყიდვა 500-ზე მეტია
SELECT category, AVG(amount) AS average_amount
FROM sales
GROUP BY category
HAVING AVG(amount) > 500;

-- 4. WHERE + GROUP BY + HAVING:
--    მხოლოდ Tbilisi → დაჯგუფება კატეგორიით → კატეგორიები მინიმუმ 2 გაყიდვით
--    (WHERE ფილტრავს სტრიქონებს დაჯგუფებამდე, HAVING — ჯგუფებს დაჯგუფების შემდეგ)
SELECT category, COUNT(*) AS sales_count, SUM(amount) AS total_amount
FROM sales
WHERE city = 'Tbilisi'
GROUP BY category
HAVING COUNT(*) >= 2;


-- =====================================================================
-- დავალება 6 — JOIN
-- =====================================================================

-- 1. INNER JOIN — მხოლოდ ის სტუდენტები, ვისაც პროფესორი ჰყავს
SELECT s.name AS student_name, p.name AS professor_name
FROM students s
INNER JOIN professors p ON s.prof_id = p.id;

-- 2. LEFT JOIN — ყველა სტუდენტი; პროფესორის არქონისას professor_name = NULL
SELECT s.name AS student_name, p.name AS professor_name
FROM students s
LEFT JOIN professors p ON s.prof_id = p.id;

-- 3. RIGHT JOIN — ყველა პროფესორი, მათ შორის სტუდენტის გარეშე (Chikovani)
SELECT p.name AS professor_name, s.name AS student_name
FROM students s
RIGHT JOIN professors p ON s.prof_id = p.id;

-- დამატებით: სამივე ცხრილი ერთად (სტუდენტი, პროფესორი, კურსი)
SELECT s.name AS student_name, p.name AS professor_name, c.title AS course_title
FROM students s
LEFT JOIN professors p ON s.prof_id = p.id
LEFT JOIN courses    c ON s.course_id = c.id;


-- =====================================================================
-- დავალება 7 — FULL OUTER JOIN-ის იმიტაცია
-- =====================================================================
-- LEFT JOIN იძლევა ყველა სტუდენტს (Luka, Tamar — პროფესორის გარეშე),
-- RIGHT JOIN იძლევა ყველა პროფესორს (Chikovani — სტუდენტის გარეშე),
-- UNION აერთიანებს და დუბლიკატებს შლის.

SELECT s.name AS student_name, p.name AS professor_name
FROM students s
LEFT JOIN professors p ON s.prof_id = p.id

UNION

SELECT s.name AS student_name, p.name AS professor_name
FROM students s
RIGHT JOIN professors p ON s.prof_id = p.id;


-- =====================================================================
-- დავალება 8 — Subquery
-- =====================================================================

-- 1. სტუდენტები, რომელთა ასაკი საშუალოზე მეტია
SELECT * FROM students
WHERE age > (
    SELECT AVG(age)
    FROM students
);

-- 2. ყველაზე უფროსი სტუდენტი
SELECT * FROM students
WHERE age = (
    SELECT MAX(age)
    FROM students
);

-- 3. ყველა, ვინც ყველაზე ახალგაზრდაზე უფროსია
SELECT * FROM students
WHERE age > (
    SELECT MIN(age)
    FROM students
);


-- =====================================================================
-- დავალება 9 — EXISTS / NOT EXISTS
-- =====================================================================

-- 1. მომხმარებლები, რომლებსაც მინიმუმ ერთი შეკვეთა აქვთ
SELECT c.*
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.id
);

-- 2. მომხმარებლები, რომლებსაც არცერთი შეკვეთა არ აქვთ (Salome, Levan)
SELECT c.*
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.id
);


-- =====================================================================
-- დავალება 10 — ANY / SOME / ALL
-- =====================================================================

-- 1. ANY — ფასი მეტია Electronics-ის მინიმუმ ერთ პროდუქტზე
--    (ფაქტობრივად: მეტია Electronics-ის ყველაზე იაფზე, ანუ 150-ზე)
SELECT * FROM products
WHERE price > ANY (
    SELECT price
    FROM products
    WHERE category = 'Electronics'
);

-- 2. SOME — იგივე ამოცანა
SELECT * FROM products
WHERE price > SOME (
    SELECT price
    FROM products
    WHERE category = 'Electronics'
);
-- შედარება: SOME არის ANY-ის სინონიმი SQL სტანდარტში.
-- ორივე ერთსა და იმავე შედეგს აბრუნებს.

-- 3. ALL — ფასი მეტია Electronics-ის ყველა პროდუქტზე
--    (ანუ მეტია ყველაზე ძვირზე, 2500-ზე → მხოლოდ Gaming PC)
SELECT * FROM products
WHERE price > ALL (
    SELECT price
    FROM products
    WHERE category = 'Electronics'
);


-- =====================================================================
-- დავალება 11 — UNION / UNION ALL
-- =====================================================================

CREATE TABLE georgian_customers (
    id   INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE foreign_customers (
    id   INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO georgian_customers (id, name, city) VALUES
(1, 'Nino',   'Tbilisi'),
(2, 'Saba',   'Batumi'),
(3, 'Ketevan','Kutaisi');

INSERT INTO foreign_customers (id, name, city) VALUES
(1, 'Nino',   'Tbilisi'),   -- იგივე ადამიანი, რაც georgian_customers-ში
(2, 'John',   'London'),
(3, 'Anna',   'Berlin');

-- UNION — დუბლიკატებს შლის: Nino ერთხელ გამოჩნდება (სულ 5 სტრიქონი)
SELECT id, name, city FROM georgian_customers
UNION
SELECT id, name, city FROM foreign_customers;

-- UNION ALL — დუბლიკატებს ტოვებს: Nino ორჯერ გამოჩნდება (სულ 6 სტრიქონი)
SELECT id, name, city FROM georgian_customers
UNION ALL
SELECT id, name, city FROM foreign_customers;

-- განსხვავება: UNION სტრიქონს დუბლიკატად თვლის მხოლოდ მაშინ, როცა
-- ყველა სვეტი ემთხვევა. UNION ALL არ ამოწმებს და ამიტომ უფრო სწრაფია.


-- =====================================================================
-- დავალება 12 — Online Shop (customers, products, orders)
-- ცხრილები და მონაცემები ზემოთაა შექმნილი:
-- 10 customers, 11 products, 20 orders
-- =====================================================================

-- ნაწილი A — თბილისი, 18–30 წელი, სახელში 'a' (Ana, Mariam, Natia)
SELECT * FROM customers
WHERE city = 'Tbilisi'
  AND age BETWEEN 18 AND 30
  AND name LIKE '%a%';

-- ნაწილი B — customer name, product name, quantity
SELECT c.name AS customer_name, p.name AS product_name, o.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN products  p ON o.product_id  = p.id
ORDER BY c.name;

-- ნაწილი C — შეკვეთების რაოდენობა და ჯამური რაოდენობა თითოეულ მომხმარებელზე
SELECT
    c.name          AS customer_name,
    COUNT(o.id)     AS order_count,
    SUM(o.quantity) AS total_quantity
FROM customers c
JOIN orders o ON o.customer_id = c.id
GROUP BY c.id, c.name;

-- ნაწილი D — მხოლოდ მინიმუმ 3 შეკვეთის მქონე (Ana, Giorgi, Nika, Luka)
SELECT
    c.name          AS customer_name,
    COUNT(o.id)     AS order_count,
    SUM(o.quantity) AS total_quantity
FROM customers c
JOIN orders o ON o.customer_id = c.id
GROUP BY c.id, c.name
HAVING COUNT(o.id) >= 3;

-- ნაწილი E — პროდუქტები, რომელთა ფასი საშუალოზე მეტია
SELECT * FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);

-- ნაწილი F — მომხმარებლები შეკვეთის გარეშე
SELECT c.*
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.id
);


-- =====================================================================
-- Final Challenge
-- =====================================================================
-- total_spent   = ყველა შეკვეთის ჯამი (quantity * price)
-- average_order = ერთი შეკვეთის საშუალო ღირებულება
-- რჩებიან მხოლოდ ისინი, ვისი ხარჯიც 1000-ზე მეტია
-- (Luka 3700, Ana 2950, Giorgi 1380, Natia 1200)

SELECT
    c.name                            AS customer_name,
    c.city                            AS city,
    COUNT(o.id)                       AS order_count,
    SUM(o.quantity)                   AS total_quantity,
    SUM(o.quantity * p.price)         AS total_spent,
    ROUND(AVG(o.quantity * p.price), 2) AS average_order
FROM customers c
JOIN orders   o ON o.customer_id = c.id
JOIN products p ON o.product_id  = p.id
GROUP BY c.id, c.name, c.city
HAVING SUM(o.quantity * p.price) > 1000
ORDER BY total_spent DESC;
