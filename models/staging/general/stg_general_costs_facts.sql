{{
    config({
        "materialized": 'view'
    })
}}

with source as (

SELECT

	[Идентификатор подключенного аккаунта]
	, [Идентификатор даты]
	, [Идентификатор сайта]
	, [Идентификатор источника трафика]
	, Показы
	, Клики
	, Расходы
	, [С учетом НДС]
	, Дата

FROM {{ source('general', 'costs_facts') }}

WHERE 1=1

)

select * from source