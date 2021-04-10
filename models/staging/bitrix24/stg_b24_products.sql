

with source as (

select

      id
    , account_id
    , product_id
    , name
    , original_name
    , description
    , measure
    , tax_rate
    , tax_included

from {{ source('bitrix24', 'products') }}

{{ filter_rows(
    account_id=var('account_id_b24'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source