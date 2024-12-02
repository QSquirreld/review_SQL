/* Вывести всё - *
select * from bike_sales;
*/

/* Вывести конкретные столбцы
select
	order_date,
	customer_country,
	profit
from bike_sales;
*/

/* Вывести уникальные значения столбцы
select distinct customer_country
from bike_sales;
*/

/* выбор уникальных значений
select distinct customer_country, customer_state
from bike_sales
order by 1, 2; -- или order by customer_country, customer_state
*/

/* выбор с сортировкой
select
	order_date,
	customer_country,
	customer_state,
	product_category,
	product_subcategory,
	product_name,
	revenue,
	profit
from bike_sales
order by
	customer_country,
	customer_state,
	order_date,
	revenue desc;
*/

/* выбор с условием
select *
from bike_sales
where (customer_country = 'France' or customer_country = 'United States')
and product_subcategory = 'Road Bikes'
and customer_age < 20
order by
	customer_age desc;
*/

/*
select *
from bike_sales
where product_name in ('Road-750 Black, 52', -- not in - обратное
						'Touring-1000 Blue')
*/

/* Выбор по временному отрезку
select *
from bike_sales
where order_date between '2011-01-01' and '2011-03-31'
order by 1;
*/

/* Выбор по приблизительному значению
select *
from bike_sales
where product_name like '%Black%'
*/

/* Выбор по приблизительному значению - 1 символ
select *
from bike_sales
where product_name like '%1__%'
*/

-- вывод штатов сша где были продажи
select distinct customer_state
from bike_sales
where customer_country = 'United States'

-- вывод таблицы, где страна - США, штат - НЮ или Техас, категория - аксессуары
-- название продукта содержит - горный, отсортировать по дате
select *
from bike_sales
where customer_country = 'United States'
and customer_state in ('New York', 'Texas')
and product_category = 'Accessories'
and product_name like '%Mountain%'
order by order_date

-- Вывод товаров, где страна - канада, категория - велосипеды, цвет - не чёрный
select distinct product_name
from bike_sales
where customer_country = 'Canada'
and product_category = 'Bikes'
and product_name not ilike '%black%'
order by 1