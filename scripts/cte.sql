-- CTE - временный результат, к которому обращаемся в запросах
with avg_sales as(
	select
		extract ("month" from order_date) as mn,
		sum(order_quantity) as total
	from bike_sales
	where
		extract ("year" from order_date) = 2016
	group by 1)

select avg(total)
from avg_sales