-- перечислим количество заказов в каждой группе
-- row_number - просто считает строки в каждом окне
select
	product_name,
	customer_age_group,
    row_number() over (partition by customer_age_group order by product_name) as num_in_age_group
from bike_sales
where product_category = 'Bikes' 
  and order_quantity = 1 
  and customer_country = 'France' 
  and customer_state = 'Yveline' 
  and order_year = 2015

-- перечислим количество моделей, в которой заинтересована каждая группа
-- dense_rank - перечисляет уникальные значения
-- rank - то же самое, но пропускал бы значения
select
	product_name,
	customer_age_group,
    dense_rank() over (partition by customer_age_group order by product_name) as num_in_age_group
from bike_sales
where product_category = 'Bikes' 
  and order_quantity = 1 
  and customer_country = 'France' 
  and customer_state = 'Yveline' 
  and order_year = 2015

-- разделим группы на подгруппы
-- предположим что мы разделили группы на 8 подгрупп для хранения например
select
	product_name,
	customer_age_group,
    ntile(8) over (partition by customer_age_group order by product_name) as num_in_age_group
from bike_sales
where product_category = 'Bikes' 
  and order_quantity = 1 
  and customer_country = 'France' 
  and customer_state = 'Yveline' 
  and order_year = 2015