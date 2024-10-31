select * from {{ref("customer_revenue")}}
where customer_name is not null and (revenue is not null and revenue <=0)