

with source as (

select

      id
    , account_id
    , user_id
    , email
    , name
    , last_name
    , second_name
    , work_company
    , work_position
    , work_phone

from {{ source('bitrix24', 'users') }}

{{ filter_rows(
    account_id=var('account_id_b24'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source