{{
    config(
        materialized='incremental',
        unique_key='id',
        pre_hook= before_begin(" truncate table {{this}}"),
        post_hook= after_commit("update {{this}}  set order_date ='2022-01-01' where id=1")
      
       

    )

}}

with sample as(
   select * from {{ref('st_order')}}
)

select * from sample
