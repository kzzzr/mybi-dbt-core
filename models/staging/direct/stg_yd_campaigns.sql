

with source as (

select

      id
    , account_id
    , campaign_id
    , name
    , campaign_type
    , status
    , state
    , status_payment
    , status_clarification
    , currency
    , daily_budget_amount
    , daily_budget_mode
    , start_date
    , end_date
    , is_actual

from {{ source('direct', 'campaigns') }}

{{ filter_rows(
    account_id=var('account_id_direct'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source