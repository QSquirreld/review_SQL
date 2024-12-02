-- узнаем самую прибыльную модель в каждой группе
select
	product_name,
	customer_age_group,
	profit,
    first_value(product_name) over (partition by customer_age_group order by profit desc) as max_profit_in_age_group
from bike_sales
where product_category = 'Bikes' 
  and order_quantity = 1 
  and customer_country = 'France' 
  and customer_state = 'Yveline' 
  and order_year = 2015