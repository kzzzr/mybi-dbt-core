select

      id
    , account_id
    , category
    , browser
    , os
    , os_version

from {{ source('metrika', 'devices') }}

{{ filter_rows(
    account_id=var('account_id_metrika')
) }}