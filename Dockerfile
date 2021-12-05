ARG DBT_VERSION=0.20.2
FROM fishtownanalytics/dbt:${DBT_VERSION}

RUN set -ex \
    && pip install dbt-clickhouse==0.20.2

ENV DBT_PROFILES_DIR=.

# ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT [ "/bin/bash" ]
