

with source as (

select

      id
    , grouping
    , source
    , medium
    , campaign
    , content
    , keyword
    , landing_page

from {{ source('general', 'traffic') }}

where 1=1

)

select * from source