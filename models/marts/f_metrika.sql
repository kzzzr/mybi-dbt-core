{{
    config({
        "materialized": 'table'
    })
}}

with source as (

    select
        
          hash_key
        , concat_key
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

    from {{ ref('aux_metrika') }}

)

select * from source