{{
    config({
        "materialized": 'view',
		"enabled": False
    })
}}

{% set account_id = var('account_id_adwords') %}

with source as (

SELECT 

	  [Идентификатор записи]
	, [Идентификатор подключенного аккаунта]
	, [Идентификатор отчета]

	, [Дата отчета]
	, [Day] as Дата

	, Network as [Рекламная сеть]
	, [Network (with search partners)] as [Рекламная сеть (с партнерами)]
	, Device as [Тип устройства]
	, [Click type] as [Тип клика]

	, CAST([Campaign ID] AS BIGINT) as [Идентификатор кампании]
	, Campaign as [Название кампании]
	, [Campaign state] as [Статус кампании]
	
	, CAST([Ad group ID] AS BIGINT) as [Идентификатор группы объявлений]
	, [Ad group] as [Название группы объявлений]
	, [Ad group state] as [Статус группы объявлений]
	
	, CAST([Ad ID] AS BIGINT) as [Идентификатор объявления]
	, Ad as [Заголовок объявления]
	, [Ad state] as [Статус объявления]
	, [Ad type] as [Тип объявления]
	, Description as [Описание объявления]

	, CAST([Keyword ID] AS BIGINT) as [Идентификатор условия показа рекламодателя]
	, [Criteria Type] as [Тип условия показа рекламодателя]
	-- , [Условие показа рекламодателя]
	
	, CAST(Clicks AS FLOAT) as Клики
	, (CAST(Cost AS FLOAT) / 1000000) as Расходы
	, CAST(Impressions AS FLOAT) as Показы
	, CAST(Interactions AS FLOAT) as [Взаимодействия]

FROM {{ source('gaw', 'custom_ads_facts') }}

WHERE 1=1
	AND [Идентификатор подключенного аккаунта] in ( {{ account_id }} )

)

select * from source