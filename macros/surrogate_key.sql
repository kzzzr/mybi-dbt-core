--------------------------
--- Surrogate hash key ---
--------------------------
{%- macro surrogate_key(field_list) -%}
    {# needed for safe_add to allow for non-keyword arguments see SO post #}
    {# https://stackoverflow.com/questions/13944751/args-kwargs-in-jinja2-macros #}
    {% set frustrating_jinja_feature = varargs %}
    {{ return(adapter.dispatch('surrogate_key')(field_list, *varargs)) }}
{% endmacro %}

------------------
--- SQL SERVER ---
------------------
{%- macro sqlserver__surrogate_key(field_list) -%}

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
    {{ mybi_dbt_core.sqlserver__hash(mybi_dbt_core.sqlserver__concat(fields)) }}

{%- endmacro -%}

{% macro sqlserver__hash(field) -%}
    HASHBYTES('SHA2_256', {{field}})
{%- endmacro %}


{% macro sqlserver__concat(fields) -%}
    concat({{ fields|join(', ') }})
{%- endmacro %}


------------------
--- CLICKHOUSE ---
------------------
{%- macro clickhouse__surrogate_key(field_list) -%}

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
            "coalesce(cast(" ~ field ~ " as String " ~ "), '')"
        ) -%}

        {%- if not loop.last %}
            {%- set _ = fields.append("'-'") -%}
        {%- endif -%}

    {%- endfor -%}

    {# {{ concat(fields) }} #}
    {{ mybi_dbt_core.clickhouse__hash(mybi_dbt_core.clickhouse__concat(fields)) }}

{%- endmacro -%}

{% macro clickhouse__hash(field) -%}
    lower(hex(MD5( {{field}} )))
{%- endmacro %}


{% macro clickhouse__concat(fields) -%}
    concat({{ fields|join(', ') }})
{%- endmacro %}


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
    {{ mybi_dbt_core.concat(fields) }}

{%- endmacro -%}