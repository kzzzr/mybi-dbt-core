{% macro hash(field) -%}
  HASHBYTES('SHA2_256', {{field}})
{%- endmacro %}
