{{
    config({
        "materialized": 'view'
    })
}}

{% set account_id = var('account_id_facebook') %}

with source as (

SELECT
      [Идентификатор набора объявлений]
	, [Идентификатор подключенного аккаунта]
	, [Внутренний идентификатор набора объявлений]
	, [Название набора объявлений]
	, [Тип оплаты набора объявлений]
	, [Статус набора объявлений]
	, [Состояние набора объявлений]
	, [Автоматические ставки]
	, [Цель оптимизации]
	, [Используется ли RTB]
	, [Стратегия оптимизации]
	, [Тип назначения рекламы]

FROM {{ source('facebook', 'adsets') }}

WHERE 1=1
	AND [Идентификатор подключенного аккаунта] in ( {{ account_id }} )

)

select * from source