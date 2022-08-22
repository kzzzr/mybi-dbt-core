ARG DBT_VERSION=1.0.0
FROM fishtownanalytics/dbt:${DBT_VERSION}

RUN set -ex \
    && pip install dbt-clickhouse==1.0.1

ENV DBT_PROFILES_DIR=.

# ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT [ "/bin/bash" ]
