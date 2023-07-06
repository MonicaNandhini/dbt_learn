select * from {{ref('stg_customer')}}
{% if var('my_var')=='a'%}
where c_custkey=1
{% else%}
where c_custkey=3
{% endif %}