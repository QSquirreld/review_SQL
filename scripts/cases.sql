-- Добавим к таблице множитель налога, который нужно будет оплатить (да, в ирл это не совсем так работает)
select product_category,
	product_name,
	cost,
	case
		when revenue > 1000
			then 'over tax'
		when revenue < 500
			then 'no tax'
		when revenue between 500 and 1000
			then 'default tax'
		else 'Another' -- если не добавить else, то будет null(пустое значение)
	end as revenue_category,
	revenue
from bike_sales