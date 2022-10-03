select 

	id
	, account_id
	, dates_id
	, campaigns_id
	, ads_id
	, traffic_id
	, all_limit
	, impressions
	, clicks
	, reach
	, video_views
	, video_views_half
	, video_views_full
	, video_clicks_site
	, join_rate
	, cost
	, sites_id
	, conversion_count
	, conversion_sum
	, cost_per_message
	, message_sends
    , gd.dt as dt
    , gd.ts as ts

from {{ source('vkontakte', 'ads_facts') }} as f
	inner join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ source_filter_rows(
    account_id=var('account_id_vkontakte')
) }}