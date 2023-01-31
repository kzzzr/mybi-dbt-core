# dbt module to build DWH on top of myBI Connect data

[![Continuous Integration Tests](https://github.com/kzzzr/mybi-dbt-core/actions/workflows/ci.yml/badge.svg)](https://github.com/kzzzr/mybi-dbt-core/actions/workflows/ci.yml)

![](https://habrastorage.org/webt/l8/9t/gu/l89tgucplrrnkg421ytbfceg7ia.png)

[mybi-dbt-core](https://github.com/kzzzr/mybi-dbt-core) is [dbt](https://www.getdbt.com/) module to quick start transformations on top of data synced by [myBI Connect](https://connect.mybi.ru/) along with multiple useful macros.

🚀 Get experience with [myBI Market + dbt demo project](https://github.com/kzzzr/mybi-dbt-showcase)

## Installation instructions

New to dbt packages? Read more about them [here](https://docs.getdbt.com/docs/building-a-dbt-project/package-management/).

* Include this package in your `packages.yml` file
* Run `dbt deps` to install the package

## Main features

### Supported Adapters
- [x] [Clickhouse](https://docs.getdbt.com/reference/warehouse-setups/clickhouse-setup)
- [x] [PostgreSQL](https://docs.getdbt.com/reference/warehouse-setups/postgres-setup)

### Sources
Reference any data source from [sources.yml](models/sources/sources.yml) as `select * from source('general', 'dates')`:

### Models + Tests

Access data tables as simple as `select * from ref('stg_yd_ads_facts')`:
* filters on `account_id` applied
* joined with date dimension
* comprehensive data testing (`unique`, `not_null`, `relationships`)

Supported data sources:
* `general` – [General]()
* `metrika` – [Yandex.Metrika](https://docs.mybi.ru/yandeks-metrika-beta-struktura-bazovoy-vygruzki/)
* `direct` – [Yandex.Direct](https://docs.mybi.ru/yandeks-direkt-struktura-bazovoy-vygruzki/)
* `ads` – [Google Ads](https://docs.mybi.ru/google-ads-struktura-bazovoy-vygruzki/)
* `mytarget` – [myTarget](https://docs.mybi.ru/mytarget-struktura-bazovoy-vygruzki/)
* `bitrix24` – [Bitrix24](https://docs.mybi.ru/bitriks24-struktura-bazovoy-vygruzki/)
* `amocrm` – [AmoCRM](https://docs.mybi.ru/amocrm-struktura-bazovoy-vygruzki/)
* `ga` – [Google Analytics](https://docs.mybi.ru/google-analytics-struktura-bazovoy-vygruzki/)
* `currency` – [Currency exchange rates](https://docs.mybi.ru/kursy-valyut-struktura-bazovoy-vygruzki/)
* `vkontakte` – [Vkontakte](https://docs.mybi.ru/vkontakte-struktura-bazovoy-vygruzki/)

### Macros

* All the macros and tests from [dbt_utils](https://github.com/dbt-labs/dbt-utils) package are available
* [source_filter_rows](macros/source_filter_rows.sql) macro to limit rows for specific accounts, dev/test environments
* (WIP) [clean_up](macros/clean_up.sql)

## Demo project (tutorial)

Get experience with worked example of this module usage:
- 🚀 [myBI Market + dbt demo project](https://github.com/kzzzr/mybi-dbt-showcase)

## Contributing

Development is done via Docker containers and .csv mock files. Refer to [integration_tests](integration_tests) folder.

Any PR will be tested with [Continuous Integration workflow](.github/workflows/ci.yml)

Development workflow looks like this: 

```bash
# launch containers: dbt, clickhouse, postgres
docker-compose build --no-cache
docker-compose up -d

# enter container with dbt installed
docker-compose exec dbt bash
cd integration_tests/

# test connections
dbt --version
dbt debug --target clickhouse
dbt debug --target postgres

# Setup target variables
export DBT_SOURCE_DATABASE=default DBT_SOURCE_SCHEMA=default # for Clickhouse
export DBT_SOURCE_DATABASE=postgres DBT_SOURCE_SCHEMA=public # for Postgres

# introduce any code changes

# install dependencies (modules)
dbt clean
dbt deps

# build and test on dummy data
dbt seed --full-refresh
dbt build --full-refresh

# exit container and clean up
docker-compose down
```
