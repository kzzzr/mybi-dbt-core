select 

	id
	, account_id
	, ad_id
	, display_url
	, final_urls
	, tracking_url_template
	, url_custom_parameters
	, "type"
	, headline
	, headline_part_one
	, headline_part_two
	, description
	, description_part_one
	, description_part_two
	, path_one
	, path_two
	, status
	, approval_status
	, phone_number
	, final_mobile_urls

from {{ source('ads', 'ads') }}

{{ source_filter_rows(
    account_id=var('account_id_ads')
) }}