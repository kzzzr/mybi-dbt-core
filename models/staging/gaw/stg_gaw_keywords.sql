{{
    config({
        "materialized": 'view'
    })
}}

with source as (

SELECT 

	  CAST([Идентификатор ключевого слова] AS BIGINT) AS [Идентификатор ключевого слова]
	, [Идентификатор подключенного аккаунта]
	, [Внутренний идентификатор ключевого слова]
	, [Ключевое слово]
	, [Конечная ссылка после редиректов]
	, [Статус ключевого слова]
	, [Стоимость показа на первой странице]
	, [Стоимость показа в верху страницы]

FROM {{ source('gaw', 'keywords') }}

{{ filter_rows(
    account_id=var('account_id_adwords'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source