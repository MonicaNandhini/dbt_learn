{{
    config(
        materialized='ephemeral'
    )
}}

with cust as(
    select * from {{source('DBT_EXE','CUSTOMER')}}
)
select * from customer 