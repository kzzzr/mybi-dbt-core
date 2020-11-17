{% macro concat(fields) -%}
    concat({{ fields|join(', ') }})
{%- endmacro %}
