{{
    config({
        "materialized": 'view'
    })
}}

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

{{ filter_rows(
    account_id=var('account_id_mytarget'),
    last_number_of_days=true, 
    ts_field='[Дата]'
) }}

)

select * from source