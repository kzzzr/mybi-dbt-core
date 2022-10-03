select

      id
    , account_id
    , category
    , action
    , label

from {{ source('ga', 'events') }}

{{ source_filter_rows(
    account_id=var('account_id_ga')
) }}