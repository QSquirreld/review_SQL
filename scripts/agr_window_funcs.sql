-- записывает вычисленное значение для блока в целом/строки группируются в свои группы

-- стандартная функция сводит множество строк в одну, 
-- возвращается один результат на группу
select
	customer_age_group,
	sum(profit) as total_profit_per_product
from bike_sales
where product_category = 'Bikes' 
  and order_quantity = 1 
  and customer_country = 'France' 
  and customer_state = 'Yveline' 
  and order_year = 2015
group by customer_age_group
order by customer_age_group;

-- оконная записывает вычисленное значение для каждой строки в блоке(окне)

-- оконная функция применяет функцию к каждой строке в выборке(окне),
-- возвращается результат каждой строки в окне
select
	product_name,
	customer_age_group,
	profit,
    sum(profit) over (partition by customer_age_group) as profit_per_age_group,
	round((profit/sum(profit) over (partition by customer_age_group))::numeric, 2) as prc_profit_per_age_group
from bike_sales
where product_category = 'Bikes' 
  and order_quantity = 1 
  and customer_country = 'France' 
  and customer_state = 'Yveline' 
  and order_year = 2015
order by profit_per_age_group desc;