select

      f.account_id as account_id
    , f.clientids_id as clientids_id
    , f.traffic_id as traffic_id
    , f.users_id as users_id
    , f.deals_id as deals_id
    , f.contacts_id as contacts_id
    , f.companies_id as companies_id
    , f.locations_id as locations_id
    , created.dt as created_dt
    , began.dt as begin_dt
    , ended.dt as end_dt
    , f.deal_total as deal_total

from {{ source('bitrix24', 'deals_facts') }} as f
	inner join {{ ref('stg_general_dates') }} as created
		on created.id = f.createdate_id
	inner join {{ ref('stg_general_dates') }} as began
		on began.id = f.begindate_id
	inner join {{ ref('stg_general_dates') }} as ended
		on ended.id = f.enddate_id

{{ filter_rows(
    account_id=var('account_id_bitrix24')
) }}