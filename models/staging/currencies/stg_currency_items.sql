select 

	  id
	, account_id
	, name
	, alphabetic_code
	, numeric_code

from {{ source('currency', 'items') }}

{{ source_filter_rows(
    account_id=var('account_id_currency')
) }}