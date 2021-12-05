select

      f.account_id as account_id
    , f.dates_id as dates_id
    , f.sites_id as sites_id
    , f.traffic_id as traffic_id
    , f.impressions_context as impressions_context
    , f.impressions_search as impressions_search
    , f.impressions as impressions
    , f.clicks_context as clicks_context
    , f.clicks_search as clicks_search
    , f.clicks as clicks
    , f.cost_context as cost_context
    , f.cost_search as cost_search
    , f.cost as cost
    , gd.dt as dt
    , gd.ts as ts

from {{ source('ga', 'costs_facts') }} as f
	inner join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ filter_rows(
    account_id=var('account_id_ga')
) }}