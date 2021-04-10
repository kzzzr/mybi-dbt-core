

with source as (

select

      id
    , account_id
    , leads_id
    , attribute_id
    , name
    , value
    , start_date
    , end_date
    , is_actual

from {{ source('amocrm', 'leads_attributes') }}

{{ filter_rows(
    account_id=var('account_id_amocrm'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source