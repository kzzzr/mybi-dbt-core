{{
    config({
        "materialized": 'view'
    })
}}

with source as (

SELECT

	[Идентификатор местоположения]
	, [Код страны]
	, Страна
	, [Код региона]
	, Регион
	, Город
	, Широта
	, Долгота

FROM {{ source('general', 'locations') }}

WHERE 1=1

)

select * from source