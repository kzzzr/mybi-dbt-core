select 

	id
	, account_id
	, post_id
	, post_type
	, marked_as_ads
	, can_delete
	, can_pin
	, content
	, group_id

from {{ source('vkontakte', 'posts') }}

{{ filter_rows(
    account_id=var('account_id_vkontakte')
) }}