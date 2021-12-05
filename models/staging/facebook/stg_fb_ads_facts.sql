select

      {{ surrogate_key(["account_id", 
	  	"campaigns_id", 
		"adsets_id", 
		"ads_id", 
		"creatives_id", 
		"dates_id", 
		"traffic_id", 
		"sites_id"])
		}} as id
    , f.account_id as account_id
    , f.dates_id as dates_id
    , f.traffic_id as traffic_id
    , f.sites_id as sites_id
    , f.campaigns_id as campaigns_id
    , f.adsets_id as adsets_id
    , f.ads_id as ads_id
    , f.creatives_id as creatives_id
    , f.clicks as clicks
    , f.unique_clicks as unique_clicks
    , f.cpc as cpc
    , f.cost_per_unique_click as cost_per_unique_click
    , f.cpm as cpm
    , f.cpp as cpp
    , f.ctr as ctr
    , f.unique_ctr as unique_ctr
    , f.frequency as frequency
    , f.impressions as impressions
    , f.reach as reach
    , f.cost as cost
    , f.total_action_value as total_action_value
    , f.total_actions as total_actions
    , f.comments as comments
    , f.likes as likes
    , f.posts as posts
    , f.leadgens as leadgens
    , f.all_clicks as all_clicks
    , f.pixel_purchase as pixel_purchase
    , f.pixel_lead as pixel_lead
    , f.landing_page_views as landing_page_views
    , f.link_clicks as link_clicks
    , f.post_reactions as post_reactions
    , f.video_views as video_views
    , gd.dt as dt
    , gd.ts	 as ts	

from {{ source('facebook', 'ads_facts') }} as f
	inner join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ filter_rows(
    account_id=var('account_id_facebook')
) }}