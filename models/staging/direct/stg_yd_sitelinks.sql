

with source as (

select

      id
    , account_id
    , ads_id
    , sitelink_id
    , title
    , href
    , description

from {{ source('direct', 'sitelinks') }}

{{ filter_rows(
    account_id=var('account_id_direct'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source