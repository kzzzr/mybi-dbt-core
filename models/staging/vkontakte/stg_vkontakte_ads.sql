select 

	id
	, account_id
	, ad_id
	, name
	, status
	, cost_type
	, ad_platform
	, approved
	, video
	, title
	, description
	, link_url
	, link_domain
	, image_src
	, ad_format
	, impressions_limit
	, impressions_limited
	, original_url
	, post_content

from {{ source('vkontakte', 'ads') }}

{{ source_filter_rows(
    account_id=var('account_id_vkontakte')
) }}