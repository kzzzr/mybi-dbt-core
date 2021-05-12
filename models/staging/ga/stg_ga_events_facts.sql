

with source as (

select

      f.account_id
    , f.dates_id
    , f.clientids_id
    , f.traffic_id
    , f.events_id
    , f.total_events
    , f.unique_events
    , f.event_value
    , f.locations_id
    , f.devices_id
    , f.sites_id
    , gd.dt
    , gd.ts    
    
from {{ source('ga', 'events_facts') }} as f
	left join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ filter_rows(
    account_id=var('account_id_ga'),
    last_number_of_days=true, 
    ts_field='dt'
) }}

)

select * from source