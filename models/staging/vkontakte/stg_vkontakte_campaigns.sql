select 

	id
	, account_id
	, campaign_id
	, name
	, status

from {{ source('vkontakte', 'campaigns') }}

{{ source_filter_rows(
    account_id=var('account_id_vkontakte')
) }}