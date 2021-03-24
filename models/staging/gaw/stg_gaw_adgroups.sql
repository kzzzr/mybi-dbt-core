

with source as (

SELECT 

	  [Идентификатор группы объявлений]
	, [Идентификатор подключенного аккаунта]
	, [Внутренний идентификатор группы объявлений]
	, [Имя группы объявлений]
	, [Статус группы объявлений]
	, [Метки группы объявлений]
	, [Шаблон отслеживания основного объекта]

FROM {{ source('gaw', 'adgroups') }}

{{ filter_rows(
    account_id=var('account_id_adwords'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source