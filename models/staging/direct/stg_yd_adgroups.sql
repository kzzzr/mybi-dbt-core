select

      id
    , account_id
    , adgroup_id
    , name
    , tracking_params
    , status
    , serving_status
    , adgroup_type
    , adgroup_subtype

from {{ source('direct', 'adgroups') }}

{{ filter_rows(
    account_id=var('account_id_direct')
) }}