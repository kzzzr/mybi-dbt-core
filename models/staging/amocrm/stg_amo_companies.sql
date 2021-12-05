select

      id
    , account_id
    , company_id
    , name
    , phone
    , email
    , site
    , is_deleted

from {{ source('amocrm', 'companies') }}

{{ filter_rows(
    account_id=var('account_id_amocrm')
) }}