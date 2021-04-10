

with source as (

select

      id
    , account_id
    , lead_id
    , title
    , name
    , second_name
    , last_name
    , company_title
    , source_id
    , source_name
    , source_description
    , status_id
    , status_name
    , status_description
    , post
    , comments
    , phone
    , email
    , web
    , im
    , is_return_customer
    , is_deleted

from {{ source('bitrix24', 'leads') }}

{{ filter_rows(
    account_id=var('account_id_b24'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source