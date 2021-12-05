select

      id
    , account_id
    , deal_id
    , title
    , deal_type
    , category_id
    , category
    , stage_id
    , stage
    , probability
    , currency
    , comments
    , additional_info
    , source_id
    , source_name
    , source_description
    , closed
    , is_return_customer
    , is_deleted

from {{ source('bitrix24', 'deals') }}

{{ filter_rows(
    account_id=var('account_id_bitrix24')
) }}