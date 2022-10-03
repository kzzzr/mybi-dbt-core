select 

      {{ dbt_utils.surrogate_key(["account_id", 
	  	"campaigns_id", 
		"adgroups_id", 
		"ads_id", 
		"dates_id", 
		"sites_id",
		"traffic_id", 
        "device"])
		}} as id
    , f.account_id as account_id
    , f.campaigns_id as campaigns_id
    , f.adgroups_id as adgroups_id
    , f.ads_id as ads_id
    , f.dates_id as dates_id
    , f.sites_id as sites_id
    , f.traffic_id as traffic_id
    , f.device as device
    , f.impressions_context as impressions_context
    , f.impressions_search as impressions_search
    , f.impressions as impressions
    , f.clicks_context as clicks_context
    , f.clicks_search as clicks_search
    , f.clicks as clicks
    , f.cost_context as cost_context
    , f.cost_search as cost_search
    , f.cost as cost
    , f.average_position as average_position
    , f.average_position_clicks as average_position_clicks
    , f.bounces as bounces
    , gd.dt as dt
    , gd.ts	as ts

from {{ source('direct', 'ads_facts') }} as f
	inner join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ source_filter_rows(
    account_id=var('account_id_direct'),
    limit_data_for_dev=true
) }}