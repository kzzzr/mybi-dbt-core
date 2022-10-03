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
    , request_id
    , loss_reason
    , loss_reason_id
    , is_deleted
    -- , is_actual
    -- , start_date
    -- , end_date

from {{ source('amocrm', 'leads') }}

{{ source_filter_rows(
    account_id=var('account_id_amocrm')
) }}