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