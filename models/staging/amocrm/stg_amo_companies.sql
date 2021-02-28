{{
    config({
        "materialized": 'view'
    })
}}

with source as (

SELECT

	[Идентификатор компании],
	[Идентификатор подключенного аккаунта],
	[Внутренний идентификатор компании],
	[Название компании],
	[Контактный телефон],
	[Контактный email],
	[Сайт компании],
	[Компания удалена]

FROM {{ source('amocrm', 'companies') }}

{{ filter_rows(
    account_id=var('account_id_amocrm'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source