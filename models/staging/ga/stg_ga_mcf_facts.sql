select

      f.account_id as account_id
    , f.dates_id as dates_id
    , f.traffic_id as traffic_id
    , f.assisted_count as assisted_count
    , f.assisted_value as assisted_value
    , f.first_count as first_count
    , f.first_value as first_value
    , f.last_count as last_count
    , f.last_value as last_value
    , f.total_count as total_count
    , f.total_value as total_value
    , f.conversion_type as conversion_type
    , f.goal_number as goal_number
    , gd.dt as dt
    , gd.ts as ts

from {{ source('ga', 'mcf_facts') }} as f
	inner join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ source_filter_rows(
    account_id=var('account_id_ga')
) }}