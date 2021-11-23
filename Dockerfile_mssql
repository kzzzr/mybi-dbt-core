ARG DBT_VERSION=0.19.1
FROM fishtownanalytics/dbt:${DBT_VERSION}

RUN set -ex \
    && buildDeps=' \
        unixodbc-dev \
        gnupg \
        curl \
    ' \
    && apt-get update -yqq \
    && apt-get upgrade -yqq \
    && apt-get install -yqq --no-install-recommends $buildDeps \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -yqq msodbcsql17 \
    && pip install dbt-sqlserver==0.19.0.2

ENV DBT_PROFILES_DIR=.

# ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT [ "/bin/bash" ]
