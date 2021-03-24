

with source as (

SELECT

	[Идентификатор пользователя]
	, [Идентификатор подключенного аккаунта]
	, [Внутренний идентификатор пользователя]
	, [Адрес электронной почты]
	, Имя
	, Фамилия
	, Отчество
	, Компания
	, Должность
	, Телефон

FROM {{ source('bitrix24', 'users') }}

{{ filter_rows(
    account_id=var('account_id_b24'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source