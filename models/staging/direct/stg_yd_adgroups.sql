{{
    config({
        "materialized": 'view'
    })
}}

with source as (

SELECT

	  [Идентификатор группы объявлений]
	, [Идентификатор подключенного аккаунта]
	, [Внутренний идентификатор группы объявлений]
	, [Название группы]
	, [Параметры для отслеживания источников]
	, [Статус группы]
	, [Статус возможности показов группы]
	, [Тип группы объявлений]
	, [Подтип группы объявлений]

FROM {{ source('direct', 'adgroups') }}

{{ filter_rows(
    account_id=var('account_id_direct'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source