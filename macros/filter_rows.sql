-- filter data for selected accounts, resize for dev, ci pipelines
{% macro filter_rows(
    account_id=none,
    last_number_of_days=none, 
    ts_field='[Дата]'
) -%}
    
    {#- prepare expression to filter on according account_id -#}
    {% if account_id -%}
        {%- set filter_account_id = '[Идентификатор подключенного аккаунта] in (' ~ account_id ~ ')' -%}
    {% else -%}
        {%- set filter_account_id = '1 = 1' -%}
    {%- endif -%}

    {#- prepare expression to filter only last N days of data (e.g. last 3 days) -#}
    {%- if target.name in ['dev', 'ci'] and last_number_of_days -%} 
        {%- set limit_rows = ts_field ~ ' >= dateadd(day, ' ~ -var('filter_days_of_data') ~ ', convert(date, getdate()))' -%}
    {%- else -%} 
        {%- set limit_rows = '1 = 1' -%}
    {%- endif -%}

    {#- prepare final filter expression -#}
    where 1 = 1
        and {{ filter_account_id }}
        and {{ limit_rows }}

{%- endmacro -%}