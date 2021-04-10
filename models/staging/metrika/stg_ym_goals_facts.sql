

with source as (

select 

      f.account_id
    , f.clientids_id
    , f.dates_id
    , f.traffic_id
    , f.goals_id
    , f.completions
    , f.goal_value
    , gd.dt
    , gd.ts	

from {{ source('metrika', 'goals_facts') }} as f
	left join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ filter_rows(
    account_id=var('account_id_metrika'),
    last_number_of_days=true, 
    ts_field='dt'
) }}

)

select * from source