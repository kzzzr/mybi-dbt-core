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
	, tracking_url_template
	, app_id
	, app_vendor
	, url_custom_parameters

from {{ source('ads', 'campaigns') }}

{{ source_filter_rows(
    account_id=var('account_id_ads')
) }}