select

      f.account_id as account_id
    , f.dates_id as dates_id
    , f.clientids_id as clientids_id
    , f.traffic_id as traffic_id
    , f.events_id as events_id
    , f.total_events as total_events
    , f.unique_events as unique_events
    , f.event_value as event_value
    , f.locations_id as locations_id
    , f.devices_id as devices_id
    , f.sites_id as sites_id
    , gd.dt as dt
    , gd.ts as ts
    
from {{ source('ga', 'events_facts') }} as f
	inner join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ filter_rows(
    account_id=var('account_id_ga')
) }}