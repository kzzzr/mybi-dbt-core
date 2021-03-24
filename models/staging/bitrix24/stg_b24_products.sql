

with source as (

SELECT

	[Идентификатор товара]
	, [Идентификатор подключенного аккаунта]
	, [Внутренний идентификатор товара]
	, [Название продукта]
	, [Исходное название продукта]
	, [Описание продукта]
	, [Название единицы измерения]
	, [Процент налога]
	, [Налог включен]

FROM {{ source('bitrix24', 'products') }}

{{ filter_rows(
    account_id=var('account_id_b24'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source