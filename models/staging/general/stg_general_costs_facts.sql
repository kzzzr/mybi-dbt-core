

with source as (

select

      {{ surrogate_key(["account_id",
        "dates_id", 
        "sites_id",
        "traffic_id"])
      }} as id
    , cf.account_id
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

{{ filter_rows(
    account_id=none,
    last_number_of_days=true, 
    ts_field='dt'
) }}

)

select * from source