

with source as (

select

      f.account_id
    , f.clientids_id
    , f.traffic_id
    , f.users_id
    , f.deals_id
    , f.contacts_id
    , f.companies_id
    , f.locations_id
    , created.dt as created_dt
    , began.dt as begin_dt
    , ended.dt as end_dt
    , f.deal_total

from {{ source('bitrix24', 'deals_facts') }} as f
	left join {{ ref('stg_general_dates') }} as created
		on created.id = f.createdate_id
	left join {{ ref('stg_general_dates') }} as began
		on began.id = f.begindate_id
	left join {{ ref('stg_general_dates') }} as ended
		on ended.id = f.enddate_id

{{ filter_rows(
    account_id=var('account_id_b24'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source