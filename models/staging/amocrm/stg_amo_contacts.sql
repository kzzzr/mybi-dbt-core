

with source as (

select

      id
    , account_id
    , contact_id
    , name
    , company
    , post
    , phone
    , email
    , request_id
    , is_deleted

from {{ source('amocrm', 'contacts') }}

{{ filter_rows(
    account_id=var('account_id_amocrm'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source