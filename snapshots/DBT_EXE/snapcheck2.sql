{% snapshot snapcheck2 %}

{{
    config(
        target_schema='snapshotscheck',
        unique_key='c_custkey',
        strategy='check',
        check_cols=["c_name"]
    )
}}

select * from {{ source('DBT_EXE', 'CUSTOMER') }}

{% endsnapshot %}