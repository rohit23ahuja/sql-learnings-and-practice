select 'rohit', 'ahuja', version();
select first_name || ' ' || last_name as "Full Name" from customer;
select now();

select first_name, last_name
from customer
where first_name = 'Kelly'
order by first_name asc, last_name desc;

select first_name, length(first_name) as len
from customer
ORDER BY len desc;

CREATE TABLE sort_demo(num INT);
-- insert some data
INSERT INTO sort_demo(num)
VALUES
  (1),
  (2),
  (3),
  (null);

  SELECT
  num
FROM
  sort_demo
ORDER BY
  num desc nulls last;

  with duplicates as (
    select customer_id, first_name, row_number() over (partition by first_name order by customer_id) as rn from customer 
  )
  select customer_id,first_name,last_name from customer  where first_name in (select first_name from duplicates where rn > 1) order by first_name;

  select first_name, count(*) from customer
  group by first_name having count(*) > 1;

  select count(*) from customer;

-- Remove duplicate first names from customer table
  with duplicates as (
   select customer_id, row_number() over (partition by first_name order by customer_id) as rn from customer
  )
  delete from customer where customer_id in (select customer_id from duplicates where rn > 1);

  CREATE TABLE colors(
  id SERIAL PRIMARY KEY,
  bcolor VARCHAR,
  fcolor VARCHAR
);

INSERT INTO
  colors (bcolor, fcolor)
VALUES
  ('red', 'red'),
  ('red', 'red'),
  ('red', NULL),
  (NULL, 'red'),
  (NULL, NULL),
  ('green', 'green'),
  ('blue', 'blue'),
  ('blue', 'blue');

SELECT
  DISTINCT bcolor, fcolor
FROM
  colors
ORDER BY
  bcolor,
  fcolor;

  SELECT 
  DISTINCT
  rental_rate
FROM
  film
ORDER BY
  rental_rate;

select first_name || ' ' || last_name as full_name from customer 
where full_name like '%a%';

select first_name, length(first_name) name_length from customer
where first_name like '%A%' and length(first_name) between 3 and 5
order by name_length desc;

SELECT
  first_name,
  last_name
FROM
  customer
WHERE
  first_name LIKE 'Bra%'
  AND last_name <> 'Motley';

select film_id, title, release_year from film order by film_id offset 4 limit 5;
select film_id, title, rental_rate from film 
where title like '%A%'
order by rental_rate desc limit 10;

CREATE TABLE basket_a (
    a INT PRIMARY KEY,
    fruit_a VARCHAR (100) NOT NULL
);

CREATE TABLE basket_b (
    b INT PRIMARY KEY,
    fruit_b VARCHAR (100) NOT NULL
);

INSERT INTO basket_a (a, fruit_a)
VALUES
    (1, 'Apple'),
    (2, 'Orange'),
    (3, 'Banana'),
    (4, 'Cucumber');

INSERT INTO basket_b (b, fruit_b)
VALUES
    (1, 'Orange'),
    (2, 'Apple'),
    (3, 'Watermelon'),
    (4, 'Pear');

select * from basket_a; 
select * from basket_b;
select a, fruit_a, b, fruit_b from basket_a
right join basket_b on fruit_a = fruit_b 
where a is null;

select a, fruit_a, b, fruit_b from basket_a
full outer join basket_b 
on fruit_a=fruit_b
where a is null or b is null;

select c.customer_id, c.first_name, p.amount, 
p.payment_date  from customer c 
inner join payment p on p.customer_id = c.customer_id
order by p.payment_date desc;

select f1.title, f2.title, f2.length 
from film f1 
inner join film f2 on f1.film_id <> f2.film_id and 
f1.length = f2.length;

CREATE TABLE employee (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR (255) NOT NULL,
  last_name VARCHAR (255) NOT NULL,
  manager_id INT,
  FOREIGN KEY (manager_id) REFERENCES employee (employee_id) ON DELETE CASCADE
);
INSERT INTO employee (employee_id, first_name, last_name, manager_id)
VALUES
  (1, 'Windy', 'Hays', NULL),
  (2, 'Ava', 'Christensen', 1),
  (3, 'Hassan', 'Conner', 1),
  (4, 'Anna', 'Reeves', 2),
  (5, 'Sau', 'Norman', 2),
  (6, 'Kelsie', 'Hays', 3),
  (7, 'Tory', 'Goff', 3),
  (8, 'Salley', 'Lester', 3);

SELECT * FROM employee;


select e1.first_name || ' ' || e1.last_name Employee,
e2.first_name || ' ' || e2.last_name Manager from employee e1
left join employee e2
on e1.manager_id = e2.employee_id
--where e1.manager_id is not null 
order by Manager;

select f1.title, f2.title, f1.length from film f1
inner join film f2
on f1.film_id > f2.film_id
and f1.length = f2.length;

-- cross join

DROP TABLE IF EXISTS T1;
CREATE TABLE
  T1 (LABEL CHAR(1) PRIMARY KEY);
DROP TABLE IF EXISTS T2;
CREATE TABLE
  T2 (score INT PRIMARY KEY);
INSERT INTO
  T1 (LABEL)
VALUES
  ('A'),
  ('B');
INSERT INTO
  T2 (score)
VALUES
  (1),
  (2),
  (3);