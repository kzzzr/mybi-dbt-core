select

      id
    , account_id
    , contact_id
    , name
    , second_name
    , last_name
    , contact_type
    , birthdate
    , post
    , comments
    , phone
    , email
    , web
    , im
    , is_deleted

from {{ source('bitrix24', 'contacts') }}

{{ filter_rows(
    account_id=var('account_id_bitrix24')
) }}