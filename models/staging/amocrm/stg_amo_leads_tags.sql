

with source as (

SELECT

	[Идентификатор записи],
	[Идентификатор подключенного аккаунта],
	[Идентификатор сделки],
	[Внутренний идентификатор метки],
	Название

FROM {{ source('amocrm', 'leads_tags') }}

{{ filter_rows(
    account_id=var('account_id_amocrm'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source