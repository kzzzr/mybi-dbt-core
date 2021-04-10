

with source as (

select

      id
    , country_iso
    , country
    , region_iso
    , region
    , city
    , latitude
    , longitude	

from {{ source('general', 'locations') }}

where 1=1

)

select * from source