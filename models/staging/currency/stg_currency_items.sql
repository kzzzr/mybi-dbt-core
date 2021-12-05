select 

	  id
	, account_id
	, name
	, alphabetic_code
	, numeric_code

from {{ source('currency', 'items') }}

{{ filter_rows(
    account_id=var('account_id_currency')
) }}