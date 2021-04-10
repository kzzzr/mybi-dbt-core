

with source as (

select

      id
    , account_id
    , user_id
    , login
    , name
    , phone
    , group_name
    , email
    , is_admin
    , is_active
    , is_free
    , mail_access
    , catalog_access
    , role_id
    , role_name
    , group_id

from {{ source('amocrm', 'users') }}

{{ filter_rows(
    account_id=var('account_id_amocrm'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source