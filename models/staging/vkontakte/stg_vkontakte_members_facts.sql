select 

	id
	, account_id
	, members_id
	, locations_id
	, groups_id

from {{ source('vkontakte', 'members_facts') }}

{{ source_filter_rows(
    account_id=var('account_id_vkontakte')
) }}