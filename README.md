# Overview

## Main features

1. Supported Adapters
    - Clickhouse (v1.2.1)
    - PostgreSQL (v1.2.1)

1. Layer with base models from myBI (to be used with dbt `ref()`)

- [x] Register data sources
- [x] Layer with base models from myBI (to be used with dbt `ref()`)
- [x] Cover base models with tests
- [x] Support macros (both Clickhouse and Postgres)
    - [x] Custom schema names: `custom_schema_management`
    - [x] Surrogate keys
    - [x] WHERE expression: limit rows
- [x] Support different versions of dbt (Release management)
- [ ] Introduce Continuous Integration testing for changes in `mybi-dbt-core`

- [ ] Document `mybi-dbt-core`: Overview (features), Quickstart, Development
- [ ] Prepare Tutorial (Showcase) with `mybi-dbt-core` (Quickstart, HowTo)


# Quickstart

* Choose database (Postgres / Clickhouse)
* Install module via `packages.yml`
* Assign variables

## Configurations

# Development

## dbt container (#1)

```bash
# launch containers: dbt, clickhouse, postgres
docker-compose up --build -d

# enter container with dbt installed
docker-compose exec dbt bash
cd integration_tests/

# test connections
dbt debug --target clickhouse
dbt debug --target postgres

# install dependencies (modules)
dbt clean && dbt deps

# build and test on dummy data
dbt seed --full-refresh
dbt run --full-refresh
dbt test

# stop containers
docker-compose down
```

## clickhouse container (#2)

```bash
docker-compose exec clickhouse bash
```