select 

	  f.id as id
	, f.account_id as account_id
	, f.items_id as items_id
	, f.dates_id as dates_id
	, f.rate as rate
	, f.minor_unit as minor_unit
    , gd.dt as dt
    , gd.ts as ts

from {{ source('currency', 'items_facts') }} as f
	inner join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ source_filter_rows(
    account_id=var('account_id_currency')
) }}