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