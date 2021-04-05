

with source as (

select

      cf.account_id
    , cf.dates_id
    , cf.sites_id
    , cf.traffic_id
    , cf.impressions
    , cf.clicks
    , cf.cost
    , cf.vat_included
    , gd.dt	
    , gd.ts	

from {{ source('general', 'costs_facts') }} as cf
	left join {{ ref('stg_general_dates') }} as gd
		on gd.id = cf.dates_id

where 1=1

)

select * from source