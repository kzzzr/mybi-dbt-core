select

      id
    , account_id
    , creative_id
    , body
    , call_to_action_type
    , image_crops
    , image_url
    , link_url
    , name
    , object_id
    , object_story_id
    , object_story_spec
    , object_url
    , thumbnail_url
    , title
    , url_tags
    , instagram_permalink_url
    , object_type
    , status
    , template_url

from {{ source('facebook', 'creatives') }}

{{ source_filter_rows(
    account_id=var('account_id_facebook')
) }}