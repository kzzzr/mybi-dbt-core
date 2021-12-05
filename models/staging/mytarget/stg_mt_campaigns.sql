select

      id
    , account_id
    , campaign_id
    , name
    , system_status
    , status
    , autobidding
    , mixing
    , age_restrictions
    , group_members
    , extended_age
    , enable_utm
    , utm

from {{ source('mytarget', 'campaigns') }}

{{ filter_rows(
    account_id=var('account_id_mytarget')
) }}