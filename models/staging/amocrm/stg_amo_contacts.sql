select

      id
    , account_id
    , contact_id
    , name
    , company
    , post
    , phone
    , email
    , request_id
    , is_deleted

from {{ source('amocrm', 'contacts') }}

{{ source_filter_rows(
    account_id=var('account_id_amocrm')
) }}