-- Delete objects from database after CI tests
{% macro clean_up() %}

    {%- if target.name in ['core_ci', 'ci'] -%}

        {% set schema = target.schema ~ '_' ~ env_var('GITHUB_PR_NUMBER') | trim %}
        {% do adapter.drop_schema(api.Relation.create(database=target.database, schema=schema)) %}

    {%- endif -%}    

{% endmacro %}