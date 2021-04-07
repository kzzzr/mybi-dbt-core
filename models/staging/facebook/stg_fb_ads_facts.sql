

with source as (

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
    , f.account_id
    , f.dates_id
    , f.traffic_id
    , f.sites_id
    , f.campaigns_id
    , f.adsets_id
    , f.ads_id
    , f.creatives_id
    , f.clicks
    , f.unique_clicks
    , f.cpc
    , f.cost_per_unique_click
    , f.cpm
    , f.cpp
    , f.ctr
    , f.unique_ctr
    , f.frequency
    , f.impressions
    , f.reach
    , f.cost
    , f.total_action_value
    , f.total_actions
    , f.comments
    , f.likes
    , f.posts
    , f.leadgens
    , f.all_clicks
    , f.pixel_purchase
    , f.pixel_lead
    , f.landing_page_views
    , f.link_clicks
    , f.post_reactions
    , f.video_views
    , gd.dt
    , gd.ts	

from {{ source('facebook', 'ads_facts') }} as f
	left join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ filter_rows(
    account_id=var('account_id_facebook'),
    last_number_of_days=false, 
    ts_field='dt'
) }}

)

select * from source