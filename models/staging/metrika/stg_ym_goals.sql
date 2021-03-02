{{
    config({
        "materialized": 'table'
    })
}}

with source as (

SELECT 

	[Идентификатор цели]
	,[Идентификатор подключенного аккаунта]
	,[Внутренний идентификатор цели]
	,[Название цели]
	,[Тип цели]

FROM {{ source('metrika', 'goals') }}

{{ filter_rows(
    account_id=var('account_id_metrika'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source