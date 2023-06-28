with stg_orders as(




    select * from {{ ref('st_order')}}

),




stg_orders_csv as (




    select * from {{ ref('orders_csv')}}

),




orders_with_orders_csv as(

    select

    stg_orders.order_id,

    stg_orders.customer_id,

    stg_orders.order_date,

    stg_orders.status,

    stg_orders_csv.id,

    stg_orders_csv.item

    from stg_orders

    left join stg_orders_csv on stg_orders.order_id = stg_orders_csv.id

)




select * from orders_with_orders_csv

