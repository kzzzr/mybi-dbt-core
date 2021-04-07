

with source as (

select

      f.account_id
    , f.clientids_id
    , f.users_id
    , f.leads_id
    , f.contacts_id
    , f.companies_id
    , f.unsorteds_id
    , created.dt as created_dt
    , closed.dt as closed_dt
    , f.price

from {{ source('amocrm', 'leads_facts') }} as f
	left join {{ ref('stg_general_dates') }} as created
		on created.id = f.created_id
	left join {{ ref('stg_general_dates') }} as closed
		on closed.id = f.closed_id

{{ filter_rows(
    account_id=var('account_id_amocrm'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source