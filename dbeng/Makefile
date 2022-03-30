#==============================================================#
# File      :   Makefile
# Ctime     :   2020-11-03
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
# entrypoint
#-----------------------------#
default: install
all: install

install: sql ui data


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
load: clean
	cat data/dbeng_trend.csv | psql ${METADB_URL} -c "COPY app.dbeng_trend FROM STDIN CSV HEADER;";

clean:
	psql ${METADB_URL} -c 'TRUNCATE app.dbeng_trend;';


.PHONY: default all install ui sql data-