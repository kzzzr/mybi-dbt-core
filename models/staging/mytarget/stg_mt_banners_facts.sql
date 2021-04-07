

with source as (

select

      {{ surrogate_key(["account_id", 
	  	"campaigns_id", 
		"banners_id",
		"dates_id", 
		"traffic_id", 
		"sites_id"])
		}} as id
	, f.account_id
    , f.dates_id
    , f.campaigns_id
    , f.banners_id
    , f.traffic_id
    , f.sites_id
    , f.impressions
    , f.clicks
    , f.cost
    , gd.dt
    , gd.ts	

from {{ source('mytarget', 'banners_facts') }} as f
	left join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ filter_rows(
    account_id=var('account_id_mytarget'),
    last_number_of_days=true, 
    ts_field='dt'
) }}

)

select * from source