ARG DBT_VERSION=1.0.0
FROM fishtownanalytics/dbt:${DBT_VERSION}

RUN set -ex \
    && python -m pip install --upgrade pip setuptools \
    && python -m pip install --upgrade dbt-core dbt-postgres dbt-clickhouse

# ARG ADAPTER_POSTGRES_VERSION=1.2.1
# ARG ADAPTER_CLICKHOUSE_VERSION=1.2.1
# RUN set -ex \
    # && pip install dbt-postgres==${ADAPTER_POSTGRES_VERSION} dbt-clickhouse==${ADAPTER_CLICKHOUSE_VERSION}

WORKDIR /usr/app/
ENV DBT_PROFILES_DIR=.

ENTRYPOINT ["tail", "-f", "/dev/null"]
