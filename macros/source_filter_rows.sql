-- macro to limit rows for specific accounts, dev/test environments
{% macro source_filter_rows(
    account_id=none,
    limit_data_for_dev=false, 
    timestamp_column='dt',
    history_depth_days=0
) -%}

    {#- prepare expression to filter on according account_id -#}
    {% if account_id -%}
        {%- set filter_account_id = 'account_id in (' ~ account_id ~ ')' -%}
    {% else -%}
        {%- set filter_account_id = 'TRUE' -%}
    {%- endif -%}
    
    {#- prepare expression to limit rows depending on target.name and flags provided -#}
    {%- if target.name in ['prod'] and history_depth_days > 0 -%}
        {%- set watermark = mybi_dbt_core.watermark(history_depth_days) -%}
        {%- set history_depth_expression = timestamp_column ~ ' >= ' ~ watermark -%}
    {%- elif target.name not in ['prod'] and limit_data_for_dev == true -%}
        {%- set watermark = mybi_dbt_core.watermark(var('limit_data_days')) -%}
        {%- set history_depth_expression = timestamp_column ~ ' >= ' ~ watermark -%}
    {%- else -%}
        {%- set history_depth_expression = 'TRUE' -%}
    {%- endif -%}

    {#- prepare final filter expression -#}
    WHERE TRUE
        AND {{ filter_account_id }}
        AND {{ history_depth_expression }}

{%- endmacro -%}


{% macro watermark(history_depth_days) %}
    {{ return(adapter.dispatch('watermark', 'mybi_dbt_core') (history_depth_days)) }}
{% endmacro %}

{% macro default__watermark(history_depth_days) %}
    {%- set watermark = '(now() - interval \'' ~ history_depth_days ~ '\' day)' -%}
    {{ return(watermark) }}
{% endmacro %}
