

with source as (

SELECT

	[Идентификатор подключенного аккаунта],
	[Идентификатор клиента],
	[Идентификатор пользователя],
	[Идентификатор сделки],
	[Идентификатор контакта],
	[Идентификатор компании],
	[Идентификатор даты открытия сделки],
	[Идентификатор даты закрытия сделки],
	Сумма

FROM {{ source('amocrm', 'leads_facts') }}

{{ filter_rows(
    account_id=var('account_id_amocrm'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source