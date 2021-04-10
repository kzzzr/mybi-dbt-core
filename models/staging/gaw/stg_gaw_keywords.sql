

with source as (

SELECT 


      id
    , account_id
    , keyword_id
    , name
    , final_urls
    , status
    , first_page_cpc
    , top_of_page_cpc

FROM {{ source('gaw', 'keywords') }}

{{ filter_rows(
    account_id=var('account_id_adwords'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source