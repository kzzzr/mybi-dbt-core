{{
    config({
        "materialized": 'view'
    })
}}

with source as (

SELECT

	[Идентификатор клиента]
	, [Идентификатор посетителя сайта]
	, [Идентификатор пользователя]
	, [Телефон клиента]
	, [e-mail клиента]

FROM {{ source('general', 'clientids') }}

WHERE 1=1

)

select * from source