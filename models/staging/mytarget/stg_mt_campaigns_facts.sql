{{
    config({
        "materialized": 'view'
    })
}}

{% set account_id = var('account_id_mytarget') %}

with source as (

SELECT

	  [Идентификатор подключенного аккаунта]
	, [Идентификатор даты]
	, [Идентификатор кампании]
	, Показы
	, Клики
	, Расходы
	, Дата

FROM {{ source('mytarget', 'campaigns_facts') }}

WHERE 1=1
	AND [Идентификатор подключенного аккаунта] in ( {{ account_id }} )

)

select * from source