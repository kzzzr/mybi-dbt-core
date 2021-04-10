

with source as (

select

      f.account_id
    , f.dates_id
    , f.sites_id
    , f.traffic_id
    , f.impressions_context
    , f.impressions_search
    , f.impressions
    , f.clicks_context
    , f.clicks_search
    , f.clicks
    , f.cost_context
    , f.cost_search
    , f.cost
    , gd.dt
    , gd.ts    

from {{ source('ga', 'costs_facts') }} as f
	left join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ filter_rows(
    account_id=var('account_id_ga'),
    last_number_of_days=true, 
    ts_field='dt'
) }}

)

select * from source