{{
    config({
        "materialized": 'view'
    })
}}

{% set account_id = var('account_id_amocrm') %}

with source as (

SELECT

	[Идентификатор пользователя],
	[Идентификатор подключенного аккаунта],
	[Внутренний идентификатор пользователя],
	Логин,
	Имя,
	Телефон,
	[Группа пользователя]

FROM {{ source('amocrm', 'users') }}

WHERE 1=1
	AND [Идентификатор подключенного аккаунта] in ( {{ account_id }} )

)

select * from source