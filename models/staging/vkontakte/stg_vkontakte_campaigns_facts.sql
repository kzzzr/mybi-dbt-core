select 

	id
	, account_id
	, dates_id
	, campaigns_id
	, day_limit
	, all_limit
	, clicks
	, impressions
	, join_rate
	, cost

from {{ source('vkontakte', 'campaigns_facts') }} as f
	inner join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ filter_rows(
    account_id=var('account_id_vkontakte')
) }}