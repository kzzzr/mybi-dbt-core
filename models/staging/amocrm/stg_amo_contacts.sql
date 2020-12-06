{{
    config({
        "materialized": 'view'
    })
}}

{% set account_id = var('account_id_amocrm') %}

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

WHERE 1=1
	AND [Идентификатор подключенного аккаунта] in ( {{ account_id }} )

)

select * from source