select

      id
    , account_id
    , adgroups_id
    , region_id
    , name
    , region_type
    , is_negative

from {{ source('direct', 'regions') }}

{{ source_filter_rows(
    account_id=var('account_id_direct')
) }}