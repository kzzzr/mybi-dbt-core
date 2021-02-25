{{
    config({
        "materialized": 'view'
    })
}}

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

{{ filter_rows(
    account_id=var('account_id_facebook'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source