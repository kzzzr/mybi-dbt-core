{# LIMIT NUMBER OF ROWS FOR DEV, CI PIPELINES TO X LAST DAYS #}
{% macro limit_last_number_of_days(ts_field) %}

    {#- prepare expression to filter only last N days of data (e.g. last 3 days) -#}
    {%- if target.name in ['dev', 'ci'] -%} 
        {%- set limit_rows = limit_last_number_of_days_expression(ts_field) -%}
    {%- else -%} 
        {%- set limit_rows = '1 = 1' -%}
    {%- endif -%}

    {{ limit_rows }}

{% endmacro %}

{% macro limit_last_number_of_days_expression(ts_field) %}
{{ return(adapter.dispatch('limit_last_number_of_days_expression') (ts_field)) }}
{% endmacro %}

{% macro clickhouse__limit_last_number_of_days_expression(ts_field) %}
    {%- set limit_rows = ts_field ~ ' >= now() - interval ' ~ var('limit_data_days') ~ ' day' -%}
    {{ return(limit_rows) }}
{% endmacro %}

{% macro sqlserver__limit_last_number_of_days_expression(ts_field) %}
    {%- set limit_rows = ts_field ~ ' >= dateadd(day, ' ~ -var('limit_data_days') ~ ', convert(date, getdate()))' -%}              
    {{ return(limit_rows) }}
{% endmacro %}


{# FILTER DATA FOR SELECTED ACCOUNTS #}
{% macro filter_rows(
    account_id=none
) -%}
    
    {#- prepare expression to filter on according account_id -#}
    {% if account_id -%}
        {%- set filter_account_id = 'account_id in (' ~ account_id ~ ')' -%}
    {% else -%}
        {%- set filter_account_id = '1 = 1' -%}
    {%- endif -%}
    
    where {{ filter_account_id }}

{%- endmacro -%}