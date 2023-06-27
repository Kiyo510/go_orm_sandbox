include .env

GO_BIN:=$(shell go env GOPATH)/bin
WD:=$(shell pwd)
MYSQL_INFO:=-h 127.0.0.1 -P 3306 -u root
DB_NAME:=orm_test
DML_DIR:=./migration/dml

# create DB table
.PHONY: migrate
migrate: ## migrate
	migrate -path migration/ddl/ -database 'mysql://root:@tcp(localhost:3306)/$(DB_NAME)?parseTime=true&loc=Local' up

.PHONY: rollback
rollback: ## migrate
	migrate -path migration/ddl/ -database 'mysql://root:@tcp(localhost:3306)/$(DB_NAME)?parseTime=true&loc=Local' down

#.PHONY: current-version
#current-version: ## migrate
#	migrate -path migration/ddl/ -database 'mysql://root:@tcp(localhost:3306)/$(DB_NAME)?parseTime=true&loc=Local' down

# insert data
.PHONY: seed
seed: ## seed
	mysql $(MYSQL_INFO) $(DB_NAME) < $(DML_DIR)/dummy_students_insert.sql

# delete data
.PHONY: delete
delete: ## delete
	mysql $(MYSQL_INFO) $(DB_NAME) < $(DML_DIR)/dummy_students_delete.sql

# .PHONY: init-local-db
# init-local-db:
# 	$(MAKE) run-db
# 	$(MAKE) migrate
# 	$(MAKE) seed

# format code
.PHONY: fmt
fmt:
	gofmt -l -w .
