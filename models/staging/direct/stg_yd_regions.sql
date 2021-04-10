

with source as (

select

      id
    , account_id
    , adgroups_id
    , region_id
    , name
    , region_type
    , is_negative

from {{ source('direct', 'regions') }}

{{ filter_rows(
    account_id=var('account_id_direct'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source