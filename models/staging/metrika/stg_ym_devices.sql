{{
    config({
        "materialized": 'table'
    })
}}

with source as (

SELECT 

	[Идентификатор типа устройства]
	,[Идентификатор подключенного аккаунта]
	,[Тип устройства]
	,Браузер
	,[Операционная система]
	,[Версия операционной системы]

FROM {{ source('metrika', 'devices') }}

{{ filter_rows(
    account_id=var('account_id_metrika'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source