{{
    config(
        materialized='incremental'
    )
}}

select * from raw.jaffle_shop.orders
{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where order_date > (select max(order_date) from {{ this }}) 
{% endif %}


