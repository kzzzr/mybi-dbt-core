select 

	  f.id as id
	, f.account_id as account_id
	, f.campaigns_id as campaigns_id
	, f.adgroups_id as adgroups_id
	, f.ads_id as ads_id
	, f.dates_id as dates_id
	, f.traffic_id as traffic_id
	, f.sites_id as sites_id
	, f.ad_network as ad_network
	, f.device as device
	, f.impressions as impressions
	, f.clicks as clicks
	, f.cost as cost
	, f.conversions as conversions
	, f.conversion_value as conversion_value
	, f.all_conversions as all_conversions
	, f.all_conversion_value as all_conversion_value
    , f.created_date as created_date
    , f.modified_date as modified_date
    , gd.dt as dt
    , gd.ts as ts

from {{ source('ads', 'ads_facts') }} as f
	inner join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ source_filter_rows(
    account_id=var('account_id_ads')
) }}