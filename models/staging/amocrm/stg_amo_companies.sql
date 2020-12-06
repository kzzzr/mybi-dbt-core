{{
    config({
        "materialized": 'view'
    })
}}

{% set account_id = var('account_id_amocrm') %}

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

WHERE 1=1
	AND [Идентификатор подключенного аккаунта] in ( {{ account_id }} )

)

select * from source