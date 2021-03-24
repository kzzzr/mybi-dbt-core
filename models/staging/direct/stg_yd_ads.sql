

with source as (

SELECT
	
	  [Идентификатор объявления]
	, [Идентификатор подключенного аккаунта]
	, [Внутренний идентификатор объявления]
	, [Статус объявления]
	, [Состояние объявления]
	, [Текстовое пояснение к статусу]
	, [Возрастная метка]
	, [Тип объявления]
	, [Подтип объявления]
	, [Заголовок объявления]
	, [Второй заголовок объявления]
	, [Текст объявления]
	, [Ссылка на сайт рекламодателя]
	, [Признак мобильного объявления]
	, [Рекламируемый домен]
	, [Отображаемая ссылка]

FROM {{ source('direct', 'ads') }}

{{ filter_rows(
    account_id=var('account_id_direct'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source