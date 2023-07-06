{%- set status_type = ['returned',
'completed',
'return_pending',
'shipped',
'placed'] -%}

with orderstatus as (
   select * from {{ ref('st_order') }}
),

final as (
   select
       order_id,
       {% for status in status_type -%}

       case when status = '{{ status }}' then status else 'NA' end
            as {{ status }}

       {%- if not loop.last -%}
         ,
       {% endif -%}

       {%- endfor %}
   from {{ ref('st_order') }}
   
)

select * from final