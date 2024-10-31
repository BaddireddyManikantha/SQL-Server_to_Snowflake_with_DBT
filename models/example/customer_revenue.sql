with cust_revenue as (select c.name as customer_name,(p.price*o.quantity) as revenue from {{ref("orders")}} o
join
{{('customers')}} c on o.customer_id=c.id
join
{{('products')}} p on o.product_id=p.id)
select customer_name, sum(revenue) as revenue 
from cust_revenue group by customer_name