select

      f.account_id as account_id
    , f.clientids_id as clientids_id
    , f.traffic_id as traffic_id
    , f.users_id as users_id
    , f.leads_id as leads_id
    , f.contacts_id as contacts_id
    , f.companies_id as companies_id
    , f.locations_id as locations_id
    , f.deals_id as deals_id
    , created.dt as created_dt
    , closed.dt as closed_dt
    , f.lead_total as lead_total

from {{ source('bitrix24', 'leads_facts') }} as f
	inner join {{ ref('stg_general_dates') }} as created
		on created.id = f.created_id
	inner join {{ ref('stg_general_dates') }} as closed
		on closed.id = f.closed_id

{{ source_filter_rows(
    account_id=var('account_id_bitrix24')
) }}