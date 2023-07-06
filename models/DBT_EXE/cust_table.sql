{{
    config(
        materialized='table'
    )
}}


with c_table as (
select * from {{ source('DBT_EXE', 'orders') }})

select * from c_table