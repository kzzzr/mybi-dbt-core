select 

	  id
	, account_id
	, group_id
	, name
	, screen_name
	, description
	, group_type
	, activity
	, age_limits
	, site
	, photo_50
	, photo_100
	, photo_200
	, is_closed
	, verified

from {{ source('vkontakte', 'groups') }}

{{ filter_rows(
    account_id=var('account_id_vkontakte')
) }}