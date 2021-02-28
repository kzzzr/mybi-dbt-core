{{
    config({
        "materialized": 'view'
    })
}}

with source as (

SELECT

	[Идентификатор контакта]
	, [Идентификатор подключенного аккаунта]
	, [Внутренний идентификатор контакта]
	, Имя
	, Отчество
	, Фамилия
	, [Тип контакта]
	, [Дата рождения]
	, Должность
	, Комментарии
	, Телефон
	, [Адрес электронной почты]
	, Сайт
	, [Служба сообщений]
	, [Контакт удален]

FROM {{ source('bitrix24', 'contacts') }}

{{ filter_rows(
    account_id=var('account_id_b24'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source