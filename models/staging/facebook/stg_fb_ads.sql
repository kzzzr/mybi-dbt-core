

with source as (

SELECT

	  [Идентификатор объявления]
	, [Идентификатор подключенного аккаунта]
	, [Внутренний идентификатор объявления]
	, [Название объявления]
	, [Статус объявления]
	, [Состояние объявления]

FROM {{ source('facebook', 'ads') }}

{{ filter_rows(
    account_id=var('account_id_facebook'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source