

with source as (

select

      id
    , account_id
    , contact_id
    , name
    , second_name
    , last_name
    , contact_type
    , birthdate
    , post
    , comments
    , phone
    , email
    , web
    , im
    , is_deleted

from {{ source('bitrix24', 'contacts') }}

{{ filter_rows(
    account_id=var('account_id_b24'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source