select 

	  id
	, account_id
	, adgroup_id
	, name
	, status
	, tracking_url_template
	, url_custom_parameters

from {{ source('ads', 'adgroups') }}

{{ filter_rows(
    account_id=var('account_id_ads')
) }}