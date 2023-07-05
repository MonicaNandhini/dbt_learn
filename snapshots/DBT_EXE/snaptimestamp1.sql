{% snapshot snaptimestamp1 %}

{{
    config(
        target_schema='snapshots',
        unique_key='o_orderkey',
        strategy='timestamp',
        updated_at='o_orderdate',
    )
}}

select * from {{ source('DBT_EXE', 'orders') }}

{% endsnapshot %}