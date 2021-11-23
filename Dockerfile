ARG DBT_VERSION=0.21.0
FROM fishtownanalytics/dbt:${DBT_VERSION}

RUN set -ex \
    && pip install dbt-clickhouse==0.21.0

ENV DBT_PROFILES_DIR=.

# ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT [ "/bin/bash" ]
