
{%- set key_field_list = [
		'[Дата]',
	  	'cid', 
	  	'gid',
		'aid'
] -%}  

with source as (

select

	-- ID
	  {{ surrogate_key(key_field_list) }} as hash_key
	, {{ concat_key(key_field_list) }} as concat_key
	
	-- , [Идентификатор записи]
	-- , [Идентификатор подключенного аккаунта]
	-- , [Идентификатор отчета]
	, Дата
	, [Дата начала недели]	
	, [UTM Source]
	, [UTM Medium]
	, [UTM Campaign]
	, [UTM Term]
	, [UTM Content]
	, cid
	, gid
	, aid
	, kwd
	, Корзина
	, [Количество страниц: 5]
	, [Количество страниц: 10]
	, [Отправка формы Бронирование примерочной]

from {{ ref('stg_metrika') }}

)

select * from source