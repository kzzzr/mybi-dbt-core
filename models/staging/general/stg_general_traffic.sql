

with source as (

SELECT

	[Идентификатор источника трафика]
	, [Название группы]
	, Источник
	, Канал
	, Кампания
	, Объявление
	, [Ключевое слово]
	, [Страница входа]

FROM {{ source('general', 'traffic') }}

WHERE 1=1

)

select * from source