{{
    config({
        "materialized": 'view'
    })
}}

{% set account_id = var('account_id_b24') %}

with source as (

SELECT

	[Идентификатор пользователя]
	, [Идентификатор подключенного аккаунта]
	, [Внутренний идентификатор пользователя]
	, [Адрес электронной почты]
	, Имя
	, Фамилия
	, Отчество
	, Компания
	, Должность
	, Телефон

FROM {{ source('bitrix24', 'users') }}

WHERE 1=1
	AND [Идентификатор подключенного аккаунта] in ({{ account_id }})

)

select * from source