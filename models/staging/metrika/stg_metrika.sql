{{
    config({
        "materialized": 'table'
    })
}}

{% set account_id = var('account_id_metrika') %}

with source as (

SELECT

	  [Идентификатор записи]
	, [Идентификатор подключенного аккаунта]
	, [Идентификатор отчета]
	, [Дата отчета] AS [Дата]
	-- , [ym:s:lastsignTrafficSource] AS [Источник трафика]
	-- , [ym:s:lastsignSourceEngine] AS [Источник трафика (детально)]
	, [ym:s:lastsignUTMSource] AS [UTM Source]
	-- , CASE
	-- 	WHEN [ym:s:lastsignUTMSource] LIKE 'yandex?yclid%' then 'yandex'
	-- 	ELSE [ym:s:lastsignUTMSource]
	--    END AS [UTM Source]
	, [ym:s:lastsignUTMMedium] AS [UTM Medium]	
	, [ym:s:lastsignUTMCampaign] AS [UTM Campaign]
	, [ym:s:lastsignUTMTerm] AS [UTM Term]
	, [ym:s:lastsignUTMContent] AS [UTM Content]	
	, NULLIF(SUBSTRING([ym:s:lastsignUTMContent]
				, NULLIF(PATINDEX('%cid|%', [ym:s:lastsignUTMContent]), 0)+4
				, NULLIF(CHARINDEX('|', [ym:s:lastsignUTMContent], NULLIF(PATINDEX('%cid|%', [ym:s:lastsignUTMContent]), 0)+4), 0) - NULLIF(PATINDEX('%cid|%', [ym:s:lastsignUTMContent])+4, 0))
		, '') AS cid
	, NULLIF(SUBSTRING([ym:s:lastsignUTMContent]
				, NULLIF(PATINDEX('%kwd|%', [ym:s:lastsignUTMContent]), 0)+4
				, NULLIF(CHARINDEX('|', [ym:s:lastsignUTMContent], NULLIF(PATINDEX('%kwd|%', [ym:s:lastsignUTMContent]), 0)+4), 0) - NULLIF(PATINDEX('%kwd|%', [ym:s:lastsignUTMContent])+4, 0))
		, '') AS kwd	
	, NULLIF(SUBSTRING([ym:s:lastsignUTMContent]
				, NULLIF(PATINDEX('%gid|%', [ym:s:lastsignUTMContent]), 0)+4
				, NULLIF(CHARINDEX('|', [ym:s:lastsignUTMContent], NULLIF(PATINDEX('%gid|%', [ym:s:lastsignUTMContent]), 0)+4), 0) - NULLIF(PATINDEX('%gid|%', [ym:s:lastsignUTMContent])+4, 0))
		, '') AS gid
	, NULLIF(SUBSTRING([ym:s:lastsignUTMContent]
				, NULLIF(PATINDEX('%aid|%', [ym:s:lastsignUTMContent]), 0)+4
				, NULLIF(CHARINDEX('|', [ym:s:lastsignUTMContent], NULLIF(PATINDEX('%aid|%', [ym:s:lastsignUTMContent]), 0)+4), 0) - NULLIF(PATINDEX('%aid|%', [ym:s:lastsignUTMContent])+4, 0))
		, '') AS aid		
	-- , CAST([ym:s:visits] AS FLOAT) AS Визиты
	-- , CAST([ym:s:users] AS FLOAT) AS Посетители
	-- , CAST([ym:s:bounceRate] AS FLOAT) AS Отказы
	-- , CAST([ym:s:pageDepth] AS FLOAT) AS [Глубина просмотра]
	-- , CAST([ym:s:avgVisitDurationSeconds] AS FLOAT) AS [Время на сайте]
	, CAST(ISNULL([ym:s:goal6644816reaches], 0) AS FLOAT) AS [Корзина]
	, CAST(ISNULL([ym:s:goal51524068reaches], 0) AS FLOAT) AS [Количество страниц: 5]
	, CAST(ISNULL([ym:s:goal51524164reaches], 0) AS FLOAT) AS [Количество страниц: 10]	
	, CAST(ISNULL([ym:s:goal47798275reaches], 0) AS FLOAT) AS [Отправка формы Бронирование примерочной]

FROM {{ source('metrika', 'custom_facts') }}

{{ filter_rows(
    account_id=var('account_id_metrika'),
    last_number_of_days=true, 
    ts_field='[Дата отчета]'
) }}

),

parsed as (

SELECT

	  [Идентификатор записи]
	, [Идентификатор подключенного аккаунта]
	, [Идентификатор отчета]
	, [Дата]
	-- , [Источник трафика]
	-- , [Источник трафика (детально)]
	-- , [UTM Source original]	
	, [UTM Source]
	, [UTM Medium]
	, [UTM Campaign]
	, [UTM Term]
	, [UTM Content]
	, cid
	, gid
	, CASE
		WHEN [UTM Source] IN ('yandex') THEN
			NULLIF(SUBSTRING(aid
					, 0
					, LEN(aid) - (CHARINDEX('_', aid)-1) )
			, '')
		ELSE aid
	  END AS aid	
	, CASE
		WHEN [UTM Source] IN ('google') THEN	
			NULLIF(SUBSTRING(kwd
						, NULLIF(PATINDEX('%[kp][wl][da]-%', kwd), 0)+4
						, LEN(kwd) - NULLIF(PATINDEX('%[kp][wl][da]-%', kwd), 0)+4)
			, '')
		ELSE kwd 
	  END AS kwd
	-- , Визиты
	-- , Посетители
	-- , Отказы
	-- , [Глубина просмотра]
	-- , [Время на сайте]
	, [Корзина]
	, [Количество страниц: 5]
	, [Количество страниц: 10]
	, [Отправка формы Бронирование примерочной]

FROM source

),

casted as (

SELECT

	  [Идентификатор записи]
	, [Идентификатор подключенного аккаунта]
	, [Идентификатор отчета]
	, [Дата]
	, CAST(DATEADD(wk, 0, DATEADD(DAY, 1-DATEPART(WEEKDAY, [Дата]), DATEDIFF(dd, 0, [Дата]))) AS DATE)
		as [Дата начала недели]		
	-- , [Источник трафика]
	-- , [Источник трафика (детально)]
	-- , [UTM Source original]
	, [UTM Source]
	, [UTM Medium]
	, [UTM Campaign]
	, [UTM Term]
	, [UTM Content]
	, TRY_CONVERT(BIGINT, cid) as cid
	, TRY_CONVERT(BIGINT, gid) as gid
	, TRY_CONVERT(BIGINT, aid) as aid	
	, TRY_CONVERT(BIGINT, kwd) as kwd	
	-- , Визиты
	-- , Посетители
	-- , Отказы
	-- , [Глубина просмотра]
	-- , [Время на сайте]
	, [Корзина]
	, [Количество страниц: 5]
	, [Количество страниц: 10]
	, [Отправка формы Бронирование примерочной]

FROM parsed

)

select * from casted