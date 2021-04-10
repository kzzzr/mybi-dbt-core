-- Delete objects from database after CI tests
{% macro clean_up() %}

    {%- if target.name in ['core_ci', 'ci'] -%}

        {# DROP SCHEMA {{ target.schema }}_{{ env_var('GITHUB_PR_NUMBER') | trim }} ; #}

        DECLARE @Sql NVARCHAR(MAX)
            , @Schema nvarchar(20)

        SET @Schema = '{{ target.schema }}_{{ env_var("GITHUB_PR_NUMBER") | trim }}'

        --tables
        SELECT @Sql = COALESCE(@Sql,'') + 'DROP TABLE %SCHEMA%.' + QUOTENAME(TABLE_NAME) + ';' + CHAR(13)
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = @Schema
            AND TABLE_TYPE = 'BASE TABLE'
        ORDER BY TABLE_NAME

        --views
        SELECT @Sql = COALESCE(@Sql,'') + 'DROP VIEW %SCHEMA%.' + QUOTENAME(TABLE_NAME) + ';' + CHAR(13)
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = @Schema
            AND TABLE_TYPE = 'VIEW'
        ORDER BY TABLE_NAME

        --Procedures
        SELECT @Sql = COALESCE(@Sql,'') + 'DROP PROCEDURE %SCHEMA%.' + QUOTENAME(ROUTINE_NAME) + ';' + CHAR(13)
        FROM INFORMATION_SCHEMA.ROUTINES
        WHERE ROUTINE_SCHEMA = @Schema
            AND ROUTINE_TYPE = 'PROCEDURE'
        ORDER BY ROUTINE_NAME

        --Functions
        SELECT @Sql = COALESCE(@Sql,'') + 'DROP FUNCTION %SCHEMA%.' + QUOTENAME(ROUTINE_NAME) + ';' + CHAR(13)
        FROM INFORMATION_SCHEMA.ROUTINES
        WHERE ROUTINE_SCHEMA = @Schema
            AND ROUTINE_TYPE = 'FUNCTION'
        ORDER BY ROUTINE_NAME

        SELECT @Sql = COALESCE(REPLACE(@Sql,'%SCHEMA%',@Schema), '')

        -- PRINT @Sql

        EXEC sp_executesql @Sql

    {%- endif -%}    

{% endmacro %}