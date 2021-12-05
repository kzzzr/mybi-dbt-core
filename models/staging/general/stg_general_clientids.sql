select

      id
    , clientid
    , userid
    , phone
    , email	

from {{ source('general', 'clientids') }}