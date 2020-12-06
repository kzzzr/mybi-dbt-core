{{
    config({
        "materialized": 'view'
    })
}}

{% set account_id = var('account_id_amocrm') %}

with source as (

SELECT

	[Идентификатор записи],
	[Идентификатор подключенного аккаунта],
	[Идентификатор сделки],
	[Внутренний идентификатор метки],
	Название

FROM {{ source('amocrm', 'leads_tags') }}

WHERE 1=1
	AND [Идентификатор подключенного аккаунта] in ( {{ account_id }} )

)

select * from source