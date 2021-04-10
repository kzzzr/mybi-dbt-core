

with source as (

select 

      {{ surrogate_key(["account_id", 
	  	"clientids_id", 
		"dates_id", 
		"traffic_id", 
		"locations_id", 
		"devices_id"])
		}} as id
	, f.account_id
    , f.clientids_id
    , f.dates_id
    , f.traffic_id
    , f.locations_id
    , f.devices_id
    , f.sessions
    , f.bounces
    , f.pageviews
    , f.duration
    , gd.dt
    , gd.ts

from {{ source('metrika', 'sessions_facts') }} as f
	left join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ filter_rows(
    account_id=var('account_id_metrika'),
    last_number_of_days=true, 
    ts_field='dt'
) }}

)

select * from source