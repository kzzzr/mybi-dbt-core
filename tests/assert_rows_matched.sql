{{
    config(
        severity='warn'
    )
}}

select
    
      coalesce(c.hash_key, t.hash_key) as hash_key    
    , coalesce(c.concat_key, t.concat_key) as concat_key

    , c.[Дата отчета]
    , c.[Рекламный кабинет]
    , c.[Идентификатор кампании]
    -- , c.[Название кампании]
    , c.[Идентификатор группы объявлений]
    -- , c.[Название группы объявлений]
    , c.[Идентификатор объявления]
    , c.[Идентификатор условия показа рекламодателя]
    -- , c.[Условие показа рекламодателя]
    
    -- , [Количество показов]
    , c.[Количество кликов]
    , c.[Стоимость кликов]

    , t.meta_is_row_match

from {{ ref('f_costs') }} c
    left join {{ ref('f_tracker') }} t
        on t.hash_key = c.hash_key

where 

       t.meta_is_row_match = 0
    or t.hash_key is null