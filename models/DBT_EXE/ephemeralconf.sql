{{
    config(
        materialized='ephemeral'
    )
}}

with cust as(
    select * from {{source('DBT_EXE','orders')}} 
select * from cust