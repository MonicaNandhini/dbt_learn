{{
    config(
        materialized='incremental',
        unique_key='id'
        pre_hook="{%if is_incremental%}"
                   turncate table {{ this }}
                   {% endif %}
        post_hook="{%if is_incremental%}"
                   update table {{ this }}
                   {% endif %}          
    )

}}