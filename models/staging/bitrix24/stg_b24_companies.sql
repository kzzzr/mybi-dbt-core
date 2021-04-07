

with source as (

select

      id
    , account_id
    , company_id
    , company_type
    , title
    , address_legal
    , banking_details
    , industry
    , employees
    , revenue
    , comments
    , phone
    , email
    , web
    , im
    , is_deleted

from {{ source('bitrix24', 'companies') }}

{{ filter_rows(
    account_id=var('account_id_b24'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source