select 

	id
	, account_id
	, dates_id
	, groups_id
	, posts_id
	, views
	, comments
	, reposts
	, likes

from {{ source('vkontakte', 'posts_facts') }} as f
	inner join {{ ref('stg_general_dates') }} as gd
		on gd.id = f.dates_id

{{ source_filter_rows(
    account_id=var('account_id_vkontakte')
) }}