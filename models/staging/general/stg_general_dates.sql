

with source as (

select

	  id
    , full_date as ts
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
    , simple_date as dt
	, cast(dateadd(wk, 0, dateadd(day, 1-datepart(weekday, simple_date), datediff(dd, 0, simple_date))) as date)
		as week_start_dt

from {{ source('general', 'dates') }}

where 1=1

)

select * from source