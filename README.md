[![Continuous Integration Tests](https://github.com/kzzzr/mybi-dbt-core/actions/workflows/ci.yml/badge.svg)](https://github.com/kzzzr/mybi-dbt-core/actions/workflows/ci.yml)
# Overview

## Main features

1. Supported Adapters
    - Clickhouse
    - PostgreSQL

2. Layer with base models from myBI (to be used with dbt `ref()`)

- [x] Register data sources
- [x] Layer with base models from myBI (to be used with dbt `ref()`)
- [x] Cover base models with tests
- [x] Support macros (both Clickhouse and Postgres)
    - [x] Custom schema names: `custom_schema_management`
    - [x] Surrogate keys
    - [x] WHERE expression: limit rows

3. Introduce Continuous Integration testing for changes in `mybi-dbt-core`

- [x] Trigger with dedicated Github Action
- [x] 1 workflow, 2 jobs (for each adapter)
- [x] `timeout-minutes`
- [x] `concurrency`
- [x] CODEOWNERS `.github/workflows`
- [x] Displaying a status badge
- [x] Fix warnings: checkout@v3, input `command`
- [ ] Matrix: Postgres [12, 13, 14], Clickhouse [22.3, 22.7, 22.8]

4. [Release management](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository)
5. [Licencing a repository](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository)

- [ ] Prepare Tutorial (Showcase) with `mybi-dbt-core` (Quickstart, HowTo)
- [ ] Document `mybi-dbt-core`: Overview (features), Quickstart, Development

# Quickstart

* Source dataset (myBI)
* Init dbt project
* Configure Docker containers (dbt, clickhouse, postgres)
* Choose database (Postgres / Clickhouse)
* Install module via `packages.yml`
* Assign variables
* Transformations (business value)
* Visualize with BI tool (mProve, Superset, Redash)

## Configurations

# Development

```bash
# launch containers: dbt, clickhouse, postgres
docker-compose up --build -d

# enter container with dbt installed
docker-compose exec dbt bash
cd integration_tests/

# test connections
dbt --version
dbt debug --target clickhouse
dbt debug --target postgres

# install dependencies (modules)
dbt clean && dbt deps

# build and test on dummy data
dbt seed --full-refresh
dbt build --full-refresh

# stop containers
docker-compose down
```
