select

      id
    , account_id
    , leads_id
    , tag_id
    , name

from {{ source('amocrm', 'leads_tags') }}

{{ filter_rows(
    account_id=var('account_id_amocrm')
) }}