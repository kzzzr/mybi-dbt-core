select

      id
    , domain
    , description

from {{ source('general', 'sites') }}