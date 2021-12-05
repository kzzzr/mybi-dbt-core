-- NON_EMPTY
{% macro test_not_empty(model, column_name) %}
  {{ return(adapter.dispatch('test_not_empty') (model, column_name)) }}
{% endmacro %}

{% macro default__test_not_empty(model, column_name) %}

    select
        count(1) as row_count
    from {{ model }}
    having count(1) = 0

{% endmacro %}


-- UNIQUE
{% macro test_unique(model) %}
    {% set macro = adapter.dispatch('test_unique') %}
    {{ macro(model, **kwargs) }}
{% endmacro %}

{% macro sqlserver__test_unique(model) %}

{% set column_name = kwargs.get('column_name', kwargs.get('arg')) %}

select count(*) as validation_errors
from (

    select
        {{ column_name }} as a

    from {{ model }}
    where {{ column_name }} is not null
    group by {{ column_name }}
    having count(*) > 1

) validation_errors

{% endmacro %}
