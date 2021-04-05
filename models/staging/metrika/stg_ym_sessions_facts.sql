

with source as (

select 

      {{ surrogate_key(["account_id", 
	  	"clientids_id", 
		"dates_id", 
		"traffic_id", 
		"locations_id", 
		"devices_id"])
		}} as session_id
	, msf.account_id
    , msf.clientids_id
    , msf.dates_id
    , msf.traffic_id
    , msf.locations_id
    , msf.devices_id
    , msf.sessions
    , msf.bounces
    , msf.pageviews
    , msf.duration
    , gd.dt
    , gd.ts

from {{ source('metrika', 'sessions_facts') }} as msf
	left join {{ ref('stg_general_dates') }} as gd
		on gd.id = msf.dates_id

{{ filter_rows(
    account_id=var('account_id_metrika'),
    last_number_of_days=true, 
    ts_field='dt'
) }}

)

select * from source