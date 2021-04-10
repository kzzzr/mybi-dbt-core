

with source as (

select

      id
    , account_id
    , ad_id
    , name
    , configured_status
    , effective_status

from {{ source('facebook', 'ads') }}

{{ filter_rows(
    account_id=var('account_id_facebook'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source