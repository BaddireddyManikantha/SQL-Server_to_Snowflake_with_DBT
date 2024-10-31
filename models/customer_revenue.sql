with cust_revenue as (select c.name as customer_name,(p.price*o.quantity) as revenue from {{ref('customers')}} c 
join {{ref('orders')}} o 
on c.id=o.customer_id
join {{ref('products')}} p
on p.id=o.product_id)
select customer_name,sum(revenue) as revenue
from cust_revenue group by customer_name