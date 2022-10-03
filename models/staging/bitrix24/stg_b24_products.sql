select

      id
    , account_id
    , product_id
    , name
    , original_name
    , description
    , measure
    , tax_rate
    , tax_included

from {{ source('bitrix24', 'products') }}

{{ source_filter_rows(
    account_id=var('account_id_bitrix24')
) }}