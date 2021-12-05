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