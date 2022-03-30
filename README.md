# Pigsty App

These are some example applications that can runs on [pigsty](https://github.com/Vonng/pigsty) environment.

Download `app.tgz` from GitHub release page: [v1.4.0](https://github.com/Vonng/pigsty-app/releases/download/v1.4.0/app.tgz)

You can install applications by `cd <app> && make`. Check [demo](http://demo.pigsty.cc) for live applications. 


### [covid](covid/)

* Visualize covid-19 data by country
* new_cases new_death cum_cases cum_death map via echarts

```bash
cd covid; make
```

### [isd](isd/)

* Vivid example of Pigsty Datalet, application made of PostgreSQL, Grafana and Echarts
* Download, Parse, Visualize Integrated Surface Dataset.
* Including 30000 meteorology station, sub-hourly observation records, from 1900-2020.

```bash
cd isd; make
```

### [dbeng](dbeng/)

* DB-Engine Trending & Prediction, Simple application

```bash
cd dbeng; make
```

### [worktime](worktime/)

* Working condition & Shift time for China company

```bash
cd worktime; make
```

### [applog](applog/)

* Apple Privacy Log

```bash
cd applog; make
```
