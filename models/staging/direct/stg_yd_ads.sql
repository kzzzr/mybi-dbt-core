select
	
      id
    , account_id
    , ad_id
    , status
    , state
    , clarification
    , age_label
    , ad_type
    , ad_subtype
    , title
    , title_two
    , text_content
    , url
    , mobile
    , display_domain
    , display_url_path

from {{ source('direct', 'ads') }}

{{ source_filter_rows(
    account_id=var('account_id_direct')
) }}