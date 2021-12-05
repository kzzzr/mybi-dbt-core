select 

      id
    , account_id
    , adgroup_id
    , name
    , status
    , labels
    , tracking_url_template

from {{ source('gaw', 'adgroups') }}

{{ filter_rows(
    account_id=var('account_id_gaw')
) }}