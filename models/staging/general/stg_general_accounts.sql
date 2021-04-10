

with source as (

select

      id
    , account_id
    , caption
    , service
    , enabled
    , status
    , interval_start
    , interval_end

from {{ source('general', 'accounts') }}

where 1=1

)

select * from source