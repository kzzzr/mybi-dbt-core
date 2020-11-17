{{
    config({
        "materialized": 'view'
    })
}}

{% set account_id = var('account_id_facebook') %}

with source as (

SELECT
	  [Идентификатор кампании]
	, [Идентификатор подключенного аккаунта]
	, [Внутренний идентификатор кампании]
	, [Название кампании]
	, [Тип оплаты кампании]
	, [Статус кампании]
	, [Состояние кампании]
	, [Цель кампании]
	, Категория
	, [Стратегия оптимизации]

FROM {{ source('facebook', 'campaigns') }}

WHERE 1=1
	AND [Идентификатор подключенного аккаунта] in ( {{ account_id }} )

)

select * from source