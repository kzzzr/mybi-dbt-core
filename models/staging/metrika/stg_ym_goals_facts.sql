

with source as (

select 

      gf.account_id
    , gf.clientids_id
    , gf.dates_id
    , gf.traffic_id
    , gf.goals_id
    , gf.completions
    , gf.goal_value
    , gd.dt
    , gd.ts	

from {{ source('metrika', 'goals_facts') }} as gf
	left join {{ ref('stg_general_dates') }} as gd
		on gd.id = gf.dates_id

{{ filter_rows(
    account_id=var('account_id_metrika'),
    last_number_of_days=true, 
    ts_field='dt'
) }}

)

select * from source