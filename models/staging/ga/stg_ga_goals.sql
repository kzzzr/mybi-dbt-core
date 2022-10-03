select

      id
    , account_id
    , goal_id
    , name
    , active

from {{ source('ga', 'goals') }}

{{ source_filter_rows(
    account_id=var('account_id_ga')
) }}