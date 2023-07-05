{{
    config(
        materialized='incremental',
        unique_key='c_custkey',
        alias='customer_scd1_tgt'
    )
}}

with cust_tgt as(
select * from {{ source('DBT_EXE', 'CUSTOMER') }}
)
select * from cust_tgt