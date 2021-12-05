select

      id
    , account_id
    , user_id
    , email
    , name
    , last_name
    , second_name
    , work_company
    , work_position
    , work_phone

from {{ source('bitrix24', 'users') }}

{{ filter_rows(
    account_id=var('account_id_bitrix24')
) }}