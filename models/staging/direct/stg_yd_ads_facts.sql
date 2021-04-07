

with source as (

select 

      {{ surrogate_key(["account_id", 
	  	"campaigns_id", 
		"adgroups_id", 
		"ads_id", 
		"dates_id", 
		"sites_id",
		"traffic_id", 
        "device"])
		}} as id
    , f.account_id
    , f.campaigns_id
    , f.adgroups_id
    , f.ads_id
    , f.dates_id
    , f.sites_id
    , f.traffic_id
    , f.device
    , f.impressions_context
    , f.impressions_search
    , f.impressions
    , f.clicks_context
    , f.clicks_search
    , f.clicks
    , f.cost_context
    , f.cost_search
    , f.cost
    , f.average_position
    , f.average_position_clicks
    , f.bounces
    , gd.dt
    , gd.ts	

from {{ source('direct', 'ads_facts') }} as f
	left join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ filter_rows(
    account_id=var('account_id_direct'),
    last_number_of_days=true, 
    ts_field='dt'
) }}

)

select * from source