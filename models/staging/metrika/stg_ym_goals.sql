{{
    config (
        enabled=false
    )
}}

select 

      id
    , account_id
    , goal_id
    , name
    , type

from {{ source('metrika', 'goals') }}

{{ source_filter_rows(
    account_id=var('account_id_metrika')
) }}