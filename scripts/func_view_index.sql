-- В пользовательской функции, в отличие от агрегатной, можно устанавливать свои условия
drop function max_revenue_product;
create or replace function max_revenue_product(input_country varchar (14))
returns smallint as

	'select max(revenue) as max_revenue
	from bike_sales
	where input_country = customer_country and order_year = 2015'

language sql;

select * from max_revenue_product('United States')
union
select * from max_revenue_product('Germany')

-- создадим "представление" чтобы лишний раз не нагружать железо(даже с индексами)
create view max_rev_result_view as
	select customer_country, max_revenue_product(customer_country)
	from bike_sales
	where customer_country IN ('United States', 'Germany')
	group by customer_country
	order by customer_country;

select * from max_rev_result_view;

-- Индекс, чтобы хоть как-то побыстрее работало..
-- лучше не использовать индексы для таблиц где часто изменяются или добавляются данные
create index idx_bs_customer_country -- b-tree - по стандарту
on bike_sales(customer_country)
-- bitmap - подходит для столбцов, где много одинаковых значений, занимают меньше места
-- столбцовые - для часто используемых столбцов, занимают меньше места,
-- стоит использовать все заданные столбцы
-- партицированные - для секций(блоков)