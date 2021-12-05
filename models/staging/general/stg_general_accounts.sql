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