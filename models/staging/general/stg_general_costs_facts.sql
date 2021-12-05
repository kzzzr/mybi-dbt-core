select

      {{ surrogate_key(["account_id",
        "dates_id", 
        "sites_id",
        "traffic_id"])
      }} as id
    , cf.account_id as account_id
    , cf.dates_id as dates_id
    , cf.sites_id as sites_id
    , cf.traffic_id as traffic_id
    , cf.impressions as impressions
    , cf.clicks as clicks
    , cf.cost as cost
    , cf.vat_included as vat_included
    , gd.dt	as dt
    , gd.ts	as ts

from {{ source('general', 'costs_facts') }} as cf
	inner join {{ ref('stg_general_dates') }} as gd
		on gd.id = cf.dates_id

{{ filter_rows(
    account_id=none
) }}