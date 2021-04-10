------------------------
--- MSSQL hash macro ---
------------------------
{% macro hash(field) -%}
  HASHBYTES('SHA2_256', {{field}})
{%- endmacro %}

--------------------------
--- MSSQL concat macro ---
--------------------------
{% macro concat(fields) -%}
    concat({{ fields|join(', ') }})
{%- endmacro %}


--------------------------
--- Surrogate hash key ---
--------------------------
{%- macro surrogate_key(field_list) -%}


{%- if varargs|length >= 1 %}

{%- do exceptions.warn("Warning: the `surrogate_key` macro now takes a single list argument instead of multiple string arguments. Support for multiple string arguments will be deprecated in a future release of dbt-utils.") -%}

{# first argument is not included in varargs, so add first element to field_list_xf #}
{%- set field_list_xf = [field_list] -%}

{%- for field in varargs %}
{%- set _ = field_list_xf.append(field) -%}
{%- endfor -%}

{%- else -%}

{# if using list, just set field_list_xf as field_list #}
{%- set field_list_xf = field_list -%}

{%- endif -%}


{%- set fields = [] -%}

{%- for field in field_list_xf -%}

    {%- set _ = fields.append(
        "coalesce(cast(" ~ field ~ " as NVARCHAR " ~ "), '')"
    ) -%}

    {%- if not loop.last %}
        {%- set _ = fields.append("'-'") -%}
    {%- endif -%}

{%- endfor -%}

{# {{ concat(fields) }} #}
{{ hash(concat(fields)) }}

{%- endmacro -%}

--------------------------------
--- Concat key for debugging ---
--------------------------------
{%- macro concat_key(field_list) -%}


{%- if varargs|length >= 1 %}

{%- do exceptions.warn("Warning: the `surrogate_key` macro now takes a single list argument instead of multiple string arguments. Support for multiple string arguments will be deprecated in a future release of dbt-utils.") -%}

{# first argument is not included in varargs, so add first element to field_list_xf #}
{%- set field_list_xf = [field_list] -%}

{%- for field in varargs %}
{%- set _ = field_list_xf.append(field) -%}
{%- endfor -%}

{%- else -%}

{# if using list, just set field_list_xf as field_list #}
{%- set field_list_xf = field_list -%}

{%- endif -%}


{%- set fields = [] -%}

{%- for field in field_list_xf -%}

    {%- set _ = fields.append(
        "coalesce(cast(" ~ field ~ " as NVARCHAR " ~ "), '')"
    ) -%}

    {%- if not loop.last %}
        {%- set _ = fields.append("'-'") -%}
    {%- endif -%}

{%- endfor -%}

{# {{ concat(fields) }} #}
{{ concat(fields) }}

{%- endmacro -%}