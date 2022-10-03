select

      f.account_id as account_id
    , f.clientids_id as clientids_id
    , f.traffic_id as traffic_id
    , f.users_id as users_id
    , f.deals_id as deals_id
    , f.contacts_id as contacts_id
    , f.companies_id as companies_id
    , f.locations_id as locations_id
    , began.dt as begin_dt
    , ended.dt as end_dt
    , f.products_id as products_id
    , f.quantity as quantity
    , f.product_total as product_total
    , f.discount as discount

from {{ source('bitrix24', 'products_facts') }} as f
	inner join {{ ref('stg_general_dates') }} as began
		on began.id = f.begindate_id
	inner join {{ ref('stg_general_dates') }} as ended
		on ended.id = f.enddate_id

{{ source_filter_rows(
    account_id=var('account_id_bitrix24')
) }}