{{
    config({
        "materialized": 'view'
    })
}}

{% set account_id = var('account_id_adwords') %}

with source as (

SELECT 

	  [Идентификатор группы объявлений]
	, [Идентификатор подключенного аккаунта]
	, [Внутренний идентификатор группы объявлений]
	, [Имя группы объявлений]
	, [Статус группы объявлений]
	, [Метки группы объявлений]
	, [Шаблон отслеживания основного объекта]

FROM {{ source('gaw', 'adgroups') }}

WHERE 1=1
	AND [Идентификатор подключенного аккаунта] in ( {{ account_id }} )

)

select * from source