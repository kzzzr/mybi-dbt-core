select 

	id
	, account_id
	, keyword_id
	, name
	, final_urls
	, status
	, first_page_cpc
	, top_of_page_cpc
	, final_mobile_urls
	, tracking_url_template
	, url_custom_parameters

from {{ source('ads', 'keywords') }}

{{ filter_rows(
    account_id=var('account_id_ads')
) }}