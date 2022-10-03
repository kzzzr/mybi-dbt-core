select

      f.account_id as account_id
    , f.dates_id as dates_id
    , f.sites_id as sites_id
    , f.clientids_id as clientids_id
    , f.devices_id as devices_id
    , f.traffic_id as traffic_id
    , f.locations_id as locations_id
    , f.session_id as session_id
    , f.user_type as user_type
    , f.sessions as sessions
    , f.bounces as bounces
    , f.pageviews as pageviews
    , f.duration as duration
    , gd.dt as dt
    , gd.ts as ts

from {{ source('ga', 'sessions_facts') }} as f
	inner join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ source_filter_rows(
    account_id=var('account_id_ga')
) }}