# Development

```bash
pipenv install dbt==0.21.0 dbt-clickhouse==0.21.0 

docker-compose up --build
docker-compose up --force-recreate

dbt clean && dbt deps
dbt run -m stg_fb_ads_facts
```

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
