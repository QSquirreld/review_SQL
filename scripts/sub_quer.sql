--Найти все заказы, в которых цена продукта (unit_price) больше средней цены по всем заказам,
--но только для тех, которые были сделаны в 2015 году и касаются категории 'Accessories'.

select *
from bike_sales
where unit_price > (select avg(unit_price)
					from bike_sales
					where order_year = 2015 and product_category = 'Accessories')
and order_year = 2015
and product_category = 'Accessories'

--Определить среднюю прибыль для каждой возрастной группы, учитываются только те заказы,
--в которых количество единиц товара (order_quantity) больше 5 и стоимость единицы (unit_cost) выше 100
select sq.customer_age_group, round(avg(sq.profit)::numeric, 2) as avg_profit
from (select customer_age_group, profit
	from bike_sales
	where order_quantity > 5 and unit_cost > 50) as sq
group by sq.customer_age_group

--Найди страны, где общая выручка больше 10,000,000,
--для тех заказов, в которых количество единиц товара больше 200.000

select customer_country, sum(revenue) as total_revenue
from bike_sales
group by customer_country
having sum(revenue) > (select 10000000)
	and (select sum(order_quantity)
	from bike_sales as bs
	where bs.customer_country = bike_sales.customer_country) > 200000;