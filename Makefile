#! /usr/bin/make -f

# @see https://github.com/oracle/docker-images/tree/main/OracleDatabase/SingleInstance
# @see https://zenn.dev/re24_1986/articles/29430f2f8b4b46

.PHONY: all create start stop clean uninstall

all: create
create:
	docker-compose up --no-start
start: create
	docker-compose up -d
	# docker-compose logs
stop:
	docker-compose stop
clean: stop
	docker rm oracle19c
uninstall: clean
	docker volume rm oracle_db-store
