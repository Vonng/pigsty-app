#==============================================================#
# File      :   Makefile
# Ctime     :   2021-10-10
# Mtime     :   2022-03-30
# Desc      :   Makefile shortcuts
# Path      :   Makefile
# Copyright (C) 2019-2020 Ruohang Feng
#==============================================================#

# pigsty environment
METADB_URL?=postgres://dbuser_dba:DBUser.DBA@10.10.10.10/meta
GRAFANA_USERNAME?=admin
GRAFANA_PASSWORD?=pigsty
GRAFANA_ENDPOINT?=http://10.10.10.10:3000

#-----------------------------#
# entry
#-----------------------------#
default: all
all: ui sql data

#-----------------------------#
# install
#-----------------------------#
ui:
	cd ui && ./grafana.py load

sql:
	psql ${METADB_URL-''} -f sql/000_base.sql    # baseline schema

data: load

#-----------------------------#
# data
#-----------------------------#
# load example data
load: clean
	cat data/example.ndjson | psql ${METADB_URL} -c "COPY app.t_privacy_log FROM STDIN; REFRESH MATERIALIZED VIEW app.privacy_log;";

clean:
	psql ${METADB_URL} -c 'TRUNCATE covid.country_history, covid.country_latest;';

.PHONY: default install all ui sql data load clean
