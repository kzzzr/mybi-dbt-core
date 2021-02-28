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
	, [Тип кампании]
	, [Статус кампании]
	, [Состояние кампании]
	, [Статус оплаты кампании]
	, [Текстовое пояснение к статусу]
	, [Валюта кампании]
	, [Дневной бюджет кампании]
	, [Тип дневного бюджета]
	, [Дата начала актуальности записи]
	, [Дата окончания актуальности записи]
	, [Признак актуальности записи]

FROM {{ source('direct', 'campaigns') }}

{{ filter_rows(
    account_id=var('account_id_direct'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source