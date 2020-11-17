{{
    config({
        "materialized": 'view'
    })
}}

with source as (

SELECT

	[Идентификатор даты]
	, [Дата и время]
	, Год
	, [Номер квартала]
	, Квартал
	, [Номер месяца]
	, Месяц
	, [Номер недели]
	, [Номер дня недели]
	, [День недели]
	, День
	, Час
	, Минута
	, Дата
	, CAST(DATEADD(wk, 0, DATEADD(DAY, 1-DATEPART(WEEKDAY, [Дата]), DATEDIFF(dd, 0, [Дата]))) AS DATE)
		as [Дата начала недели]		

FROM {{ source('general', 'dates') }}

WHERE 1=1

)

select * from source