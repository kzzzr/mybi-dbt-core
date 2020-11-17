{{
    config({
        "materialized": 'view'
    })
}}

{% set account_id = var('account_id_facebook') %}

with source as (

SELECT

	  [Идентификатор объявления]
	, [Идентификатор подключенного аккаунта]
	, [Внутренний идентификатор объявления]
	, [Название объявления]
	, [Статус объявления]
	, [Состояние объявления]

FROM {{ source('facebook', 'ads') }}

WHERE 1=1
	AND [Идентификатор подключенного аккаунта] in ( {{ account_id }} )

)

select * from source