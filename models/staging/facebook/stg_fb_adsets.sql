{{
    config({
        "materialized": 'view'
    })
}}

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

{{ filter_rows(
    account_id=var('account_id_facebook'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source