with orders(


    select * from {{ref('st_order')}}
),

daily as(
select order_date, count(*) 
from orders
group by 1
)

select * from orders