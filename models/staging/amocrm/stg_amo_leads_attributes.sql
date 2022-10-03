select

      id
    , account_id
    , leads_id
    , attribute_id
    , name
    , value
    -- , is_actual
    -- , start_date
    -- , end_date

from {{ source('amocrm', 'leads_attributes') }}

{{ source_filter_rows(
    account_id=var('account_id_amocrm')
) }}