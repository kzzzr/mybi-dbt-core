

with source as (

select 

      id
    , account_id
    , goal_id
    , name
    , type

from {{ source('metrika', 'goals') }}

{{ filter_rows(
    account_id=var('account_id_metrika'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source