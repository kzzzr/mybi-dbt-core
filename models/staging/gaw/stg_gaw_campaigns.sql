select

      id
    , account_id
    , campaign_id
    , name
    , status
    , serving_status
    , ad_serving_optimization_status
    , advertising_channel_type
    , advertising_channel_sub_type
    , labels
    , tracking_url_template
    , app_id
    , app_vendor
    , start_date
    , end_date
    , is_actual

from {{ source('gaw', 'campaigns') }}

{{ filter_rows(
    account_id=var('account_id_gaw')
) }}