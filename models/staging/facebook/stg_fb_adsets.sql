select

      id
    , account_id
    , adset_id
    , name
    , billing_event
    , configured_status
    , effective_status
    , is_autobid
    , optimization_goal
    , rtb_flag
    , bid_strategy
    , destination_type

from {{ source('facebook', 'adsets') }}

{{ source_filter_rows(
    account_id=var('account_id_facebook')
) }}