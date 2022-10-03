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
    -- , is_actual
    -- , start_date
    -- , end_date

from {{ source('direct', 'campaigns') }}

{{ source_filter_rows(
    account_id=var('account_id_direct')
) }}