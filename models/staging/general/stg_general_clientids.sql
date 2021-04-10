

with source as (

select

      id
    , clientid
    , userid
    , phone
    , email	

from {{ source('general', 'clientids') }}

where 1=1

)

select * from source