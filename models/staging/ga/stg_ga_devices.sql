select

      id
    , account_id
    , category
    , browser
    , browser_version
    , os
    , os_version

from {{ source('ga', 'devices') }}

{{ source_filter_rows(
    account_id=var('account_id_ga')
) }}