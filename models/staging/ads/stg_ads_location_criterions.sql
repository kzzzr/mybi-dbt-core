select 

	  id
	, account_id
	, campaigns_id
	, criterion_id
	, location_name
	, display_type
	, targeting_status
	, is_negative
	, canonical_name
	, country_code

from {{ source('ads', 'location_criterions') }}

{{ filter_rows(
    account_id=var('account_id_ads')
) }}