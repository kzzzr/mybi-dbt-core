select

      id
    , account_id
    , campaigns_id
    , criterion_id
    , location_name
    , display_type
    , targeting_status
    , is_negative

from {{ source('gaw', 'location_criterions') }}

{{ filter_rows(
    account_id=var('account_id_gaw')
) }}