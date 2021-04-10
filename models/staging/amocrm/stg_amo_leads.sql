

with source as (

select

      id
    , account_id
    , lead_id
    , name
    , pipeline
    , pipeline_id
    , status
    , status_id
    , status_order
    , start_date
    , end_date
    , is_actual
    , request_id
    , loss_reason
    , loss_reason_id
    , is_deleted

from {{ source('amocrm', 'leads') }}

{{ filter_rows(
    account_id=var('account_id_amocrm'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source