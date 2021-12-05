select 

      {{ surrogate_key(["account_id", 
	  	"campaigns_id", 
		"adgroups_id", 
		"keywords_id", 
		"dates_id", 
		"traffic_id", 
		"sites_id",
        "device"])
		}} as id
	, f.account_id as account_id
    , f.campaigns_id as campaigns_id
    , f.adgroups_id as adgroups_id
    , f.keywords_id as keywords_id
    , f.dates_id as dates_id
    , f.traffic_id as traffic_id
    , f.sites_id as sites_id
    , f.device as device
    , f.impressions as impressions
    , f.impressions_context as impressions_context
    , f.impressions_search as impressions_search
    , f.clicks as clicks
    , f.clicks_context as clicks_context
    , f.clicks_search as clicks_search
    , f.cost as cost
    , f.cost_context as cost_context
    , f.cost_search as cost_search
    , f.average_position as average_position
    , f.conversions as conversions
    , f.conversion_value as conversion_value
    , f.all_conversions as all_conversions
    , f.all_conversion_value as all_conversion_value
    , gd.dt as dt
    , gd.ts as ts

from {{ source('gaw', 'keywords_facts') }} as f
	inner join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ filter_rows(
    account_id=var('account_id_gaw')
) }}