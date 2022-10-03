{{
    config (
        enabled=false
    )
}}

select 

      id
    , account_id
    , purchase_id

from {{ source('metrika', 'purchases') }}

{{ source_filter_rows(
    account_id=var('account_id_metrika')
) }}