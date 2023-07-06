{{
  config(
         materialized ='incremental',
         unique_key ='c_custkey',
         cluster_by =['Activestatus'],
         incremental_strategy ='merge',
         incremental_predicates =["DBT_trt.Activestatus ='Y'"]
        )
}}
with act_cust as(
    select * from {{ source('DBT_EXE','CUSTOMER')}}
    {%if is_incremental() %}
      where Activestatus ='Y'
      {%endif%}
)

select * from act_cust
