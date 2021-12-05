{% macro cast_to_timestamp(field) -%}
  {{ return(adapter.dispatch('cast_to_timestamp') (field)) }}
{%- endmacro %}


{% macro default__cast_to_timestamp(field) -%}
    {{ field }}::timestamp
{%- endmacro %}


{% macro clickhouse__cast_to_timestamp(field) -%}
    parseDateTime32BestEffortOrNull({{ field }})
{%- endmacro %}


{% macro sqlserver__cast_to_timestamp(field) -%}
    cast({{ field }} as timestamp)
{%- endmacro %}