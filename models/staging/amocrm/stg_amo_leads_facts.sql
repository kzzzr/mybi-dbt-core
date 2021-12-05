select

      f.account_id as account_id
    , f.clientids_id as clientids_id
    , f.users_id as users_id
    , f.leads_id as leads_id
    , f.contacts_id as contacts_id
    , f.companies_id as companies_id
    , f.unsorteds_id as unsorteds_id
    , created.dt as created_dt
    , closed.dt as closed_dt
    , f.price as price

from {{ source('amocrm', 'leads_facts') }} as f
	inner join {{ ref('stg_general_dates') }} as created
		on created.id = f.created_id
	inner join {{ ref('stg_general_dates') }} as closed
		on closed.id = f.closed_id

{{ filter_rows(
    account_id=var('account_id_amocrm')
) }}