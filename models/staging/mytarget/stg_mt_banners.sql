

{% set account_id = var('account_id_mytarget') %}

with source as (

SELECT

	  [Идентификатор объявления]
	, [Идентификатор подключенного аккаунта]
	, [Внутренний идентификатор объявления]
	, [Заголовок объявления]
	, [Текстовое содержимое объявления]
	, [Иное содержимое объявления]
	, [Системный статус объявления]
	, [Статус объявления]
	, [Статус модерации]
	, [Причина модерации]
	, [Номер телефона]
	, [Ссылка в объявлении]
	, [Набор ссылок]

FROM {{ source('mytarget', 'banners') }}

{{ filter_rows(
    account_id=var('account_id_mytarget'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source