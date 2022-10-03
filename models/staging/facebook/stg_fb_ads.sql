select

      id
    , account_id
    , ad_id
    , name
    , configured_status
    , effective_status

from {{ source('facebook', 'ads') }}

{{ source_filter_rows(
    account_id=var('account_id_facebook')
) }}