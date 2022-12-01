-- NON_EMPTY
{% macro test_not_empty(model, column_name) %}
  {{ return(adapter.dispatch('test_not_empty', 'mybi_dbt_core') (model, column_name)) }}
{% endmacro %}

{% macro default__test_not_empty(model, column_name) %}

    select
        count(1) as row_count
    from {{ model }}
    having count(1) = 0

{% endmacro %}
