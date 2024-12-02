-- с сегодняшнего дня скидки на аксессуары
-- скидки у нас почему-то в бд указываются..
create or replace function accessories_sales()
returns trigger as 
$$begin
    if new.product_category = 'Accessories' then
		new.cost = new.cost * 0.8;
	end if;
	return new;
end;$$
LANGUAGE plpgsql;

create trigger insert_accessories_sales
before insert on bike_sales
for each row
execute function accessories_sales();

INSERT INTO bike_sales (order_date,order_day,order_month,order_year,
customer_age,customer_age_group,customer_gender,customer_country,customer_state,
product_category,product_subcategory,product_name,
order_quantity,unit_cost,unit_price,profit,cost,revenue)
VALUES ('2022-11-26',26,'November',2022,
19,'Youth (<25)','M','Canada','British Columbia',
'Accessories','Bike Racks','Hitch Rack - 4-Bike',
8,45,120,590,360,950);

SELECT *
FROM bike_sales
ORDER BY order_date DESC
LIMIT 1;