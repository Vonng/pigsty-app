#==============================================================#
# File      :   Makefile
# Ctime     :   2022-03-20
# Mtime     :   2022-03-20
# Desc      :   Makefile shortcuts
# Path      :   Makefile
# Copyright (C) 2018-2022 Ruohang Feng (rh@vonng.com)
#==============================================================#

copy: covid isd dbeng work applog


covid:
	ssh meta mkdir -p app
	ssh meta 'rm -rf ~/app/covid'
	scp -r covid meta:~/app/covid

isd:
	ssh meta mkdir -p app
	ssh meta 'rm -rf ~/app/isd'
	scp -r isd meta:~/app/isd

dbeng:
	ssh meta mkdir -p app
	ssh meta 'rm -rf ~/app/dbeng'
	scp -r dbeng meta:~/app/dbeng

work:
	ssh meta mkdir -p app
	ssh meta 'rm -rf ~/app/worktime'
	scp -r worktime meta:~/app/worktime

applog:
	ssh meta mkdir -p app
	ssh meta 'rm -rf ~/app/applog'
	scp -r applog meta:~/app/applog


.PHONY: copy covid isd dbeng work applog