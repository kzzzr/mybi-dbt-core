ARG DBT_VERSION=1.0.0
FROM fishtownanalytics/dbt:${DBT_VERSION}

ARG ADAPTER_POSTGRES_VERSION=1.2.1
RUN set -ex \
    && pip install dbt-postgres==${ADAPTER_POSTGRES_VERSION}

ARG ADAPTER_CLICKHOUSE_VERSION=1.2.1
RUN set -ex \
    && pip install dbt-clickhouse==${ADAPTER_CLICKHOUSE_VERSION}

WORKDIR /usr/app/
ENV DBT_PROFILES_DIR=.

ENTRYPOINT ["tail", "-f", "/dev/null"]
