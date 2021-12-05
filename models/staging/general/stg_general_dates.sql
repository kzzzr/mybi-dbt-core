select

	  id
    , {{ cast_to_timestamp('full_date') }} as ts
    , {{ cast_to_timestamp('simple_date') }} as dt
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

where {{ limit_last_number_of_days(ts_field='dt') }}