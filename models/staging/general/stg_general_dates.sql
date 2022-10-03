select

	  id
    , full_date as ts
    , simple_date as dt
    , year
    , quarter
    , quarter_label
    , month
    , month_label
    , week
    , weekday
    , weekday_label
    , day
    , hour
    , minute

from {{ source('general', 'dates') }}

{{ source_filter_rows() }}
