select

      {{ dbt_utils.surrogate_key(["account_id", 
	  	"campaigns_id",
		"dates_id"])
		}} as id
    , f.account_id as account_id
    , f.dates_id as dates_id
    , f.campaigns_id as campaigns_id
    , f.impressions as impressions
    , f.clicks as clicks
    , f.cost as cost
    , gd.dt as dt
    , gd.ts as ts

from {{ source('mytarget', 'campaigns_facts') }} as f
	inner join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ source_filter_rows(
    account_id=var('account_id_mytarget')
) }}