

with source as (

SELECT

	[Идентификатор контакта],
	[Идентификатор подключенного аккаунта],
	[Внутренний идентификатор контакта],
	[Имя контакта],
	Компания,
	Должность,
	Телефон,
	[e-mail],
	[Идентификатор заявки],
	[Контакт удален]

FROM {{ source('amocrm', 'contacts') }}

{{ filter_rows(
    account_id=var('account_id_amocrm'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source