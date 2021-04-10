

with source as (

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
	, f.account_id
    , f.campaigns_id
    , f.adgroups_id
    , f.keywords_id
    , f.dates_id
    , f.traffic_id
    , f.sites_id
    , f.device
    , f.impressions
    , f.impressions_context
    , f.impressions_search
    , f.clicks
    , f.clicks_context
    , f.clicks_search
    , f.cost
    , f.cost_context
    , f.cost_search
    , f.average_position
    , f.conversions
    , f.conversion_value
    , f.all_conversions
    , f.all_conversion_value
    , gd.dt
    , gd.ts	

from {{ source('gaw', 'keywords_facts') }} as f
	left join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ filter_rows(
    account_id=var('account_id_adwords'),
    last_number_of_days=true, 
    ts_field='dt'
) }}

)

select * from source