select 

      f.account_id as account_id
    , f.clientids_id as clientids_id
    , f.dates_id as dates_id
    , f.traffic_id as traffic_id
    , f.goals_id as goals_id
    , f.completions as completions
    , f.goal_value as goal_value
    , gd.dt as dt
    , gd.ts	as ts

from {{ source('metrika', 'goals_facts') }} as f
	inner join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ filter_rows(
    account_id=var('account_id_metrika')
) }}