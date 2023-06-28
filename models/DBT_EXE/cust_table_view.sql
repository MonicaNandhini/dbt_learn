{{
    config(
        materialized='view'
    )
}}


with c_table as (
select * from {{ source('DBT_EXE', 'CUSTOMER') }})

select * from c_table