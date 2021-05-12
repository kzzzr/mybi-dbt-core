

with source as (

select

      f.account_id
    , f.dates_id
    , f.traffic_id
    , f.assisted_count
    , f.assisted_value
    , f.first_count
    , f.first_value
    , f.last_count
    , f.last_value
    , f.total_count
    , f.total_value
    , f.conversion_type
    , f.goal_number
    , gd.dt
    , gd.ts    

from {{ source('ga', 'mcf_facts') }} as f
	left join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ filter_rows(
    account_id=var('account_id_ga'),
    last_number_of_days=true, 
    ts_field='dt'
) }}

)

select * from source