

with source as (

select 

      pf.account_id
    , pf.clientids_id
    , pf.dates_id
    , pf.traffic_id
    , pf.purchases_id
    , pf.revenue
    , gd.dt
    , gd.ts	

from {{ source('metrika', 'purchases_facts') }} as pf
	left join{{ ref('stg_general_dates') }} as gd
		on gd.id = pf.dates_id

{{ filter_rows(
    account_id=var('account_id_metrika'),
    last_number_of_days=true, 
    ts_field='[Дата]'
) }}

)

select * from source