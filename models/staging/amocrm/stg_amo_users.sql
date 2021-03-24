

with source as (

SELECT

	[Идентификатор пользователя],
	[Идентификатор подключенного аккаунта],
	[Внутренний идентификатор пользователя],
	Логин,
	Имя,
	Телефон,
	[Группа пользователя]

FROM {{ source('amocrm', 'users') }}

{{ filter_rows(
    account_id=var('account_id_amocrm'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source