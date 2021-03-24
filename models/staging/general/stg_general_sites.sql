

with source as (

SELECT

	[Идентификатор сайта]
	, [Доменное имя]
	, Описание

FROM {{ source('general', 'sites') }}

WHERE 1=1

)

select * from source