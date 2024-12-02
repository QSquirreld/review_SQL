/* Простая группировка
select
	customer_country,
	customer_state
from bike_sales
group by
	customer_country,
	customer_state
order by
	customer_country,
	customer_state
*/

-- having, в отличие от where, фильтрует сгруппированные и уже отфильтрованные where значения
-- where - фильтрует таблицу перед группировкой

-- Вывод страны, штата, дохода и прибыли за 2016 год,
-- сгруппированного по штатам в стране,
-- при этом прибыль штата должна составлять от 100000,
-- отсортировать по странам и убыванию прибыли
select
	customer_country,
	customer_state,
	sum(revenue) as revenue, -- агрегатные функции
	sum(profit) as profit
from bike_sales
where order_year = 2016
group by
	customer_country,
	customer_state
having sum(profit) > 100000
order by
	customer_country,
	profit desc

/*

*/

select
	product_category,
	product_subcategory,
	sum(revenue) as revenue,
	sum(cost) as cost,
	sum(profit) as profit
from bike_sales
where order_year = 2015
	and customer_gender = 'M'
group by
	product_category,
	product_subcategory
having sum(profit) > 50000
order by
	product_category,
	sum(profit) desc