

with source as (

select

      id
    , domain
    , description

from {{ source('general', 'sites') }}

where 1=1

)

select * from source