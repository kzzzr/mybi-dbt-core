

with source as (

select

      id
    , account_id
    , category
    , action
    , label

from {{ source('ga', 'events') }}

{{ filter_rows(
    account_id=var('account_id_ga'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source