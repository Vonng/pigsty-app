# Applog Visualization

Visualize apple privacy log file

## Install

```bash
make
```

Subtasks:

```bash
make ui         # install grafana dashboards
make sql        # install database schemas
make data       # load example data into database
```


## How to pour data into table?

First, download your apple privacy log (iOS 15)

Setting -> Privacy -> Enable App Privacy Log -> Enable -> Store App Privacy Log

Pour that `.ndjson` log file into table with:


```bash
cat /tmp/your_privacy_log.ndjson \
  | psql -AXtwc 'TRUNCATE app.t_privacy_log;COPY app.t_privacy_log FROM STDIN;REFRESH MATERIALIZED VIEW app.privacy_log;'
```
