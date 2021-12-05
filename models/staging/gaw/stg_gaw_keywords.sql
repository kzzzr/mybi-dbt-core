select 


      id
    , account_id
    , keyword_id
    , name
    , final_urls
    , status
    , first_page_cpc
    , top_of_page_cpc

from {{ source('gaw', 'keywords') }}

{{ filter_rows(
    account_id=var('account_id_gaw')
) }}