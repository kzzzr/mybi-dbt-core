

with source as (

SELECT 

	[Идентификатор подключенного аккаунта]
	,[Идентификатор клиента]
	,[Идентификатор даты]
	,[Идентификатор источника трафика]
	,[Идентификатор покупки]
	,Доход
	,Дата

FROM {{ source('metrika', 'purchases_facts') }}

{{ filter_rows(
    account_id=var('account_id_metrika'),
    last_number_of_days=true, 
    ts_field='[Дата]'
) }}

)

select * from source