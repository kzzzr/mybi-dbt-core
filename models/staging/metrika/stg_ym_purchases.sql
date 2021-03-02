{{
    config({
        "materialized": 'table'
    })
}}

with source as (

SELECT 

	[Идентификатор покупки]
	,[Идентификатор подключенного аккаунта]
	,[Внутренний идентификатор покупки]

FROM {{ source('metrika', 'purchases') }}

{{ filter_rows(
    account_id=var('account_id_metrika'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source