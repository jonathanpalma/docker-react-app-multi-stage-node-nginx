define GetFromPkg
$(shell node -p "require('./package.json').$(1)")
endef

PROJECT      := $(call GetFromPkg,name)
LAST_VERSION := $(call GetFromPkg,version)
DOCKER_BRIDGE=$(shell ip route|grep 'docker'|cut -d' ' -f12-12| tr '\n' ' ')
export DOCKER_BRIDGE_IP =${DOCKER_BRIDGE}

help:
	@echo "Project: ${PROJECT}"
	@echo "Version: ${LAST_VERSION}"
	@echo "-- Help Menu"
	@echo ""
	@echo "   1. make build        - build containers"
	@echo "   2. make start        - start containers"
	@echo "   3. make deploy       - build and start containers"
	@echo "   4. make stop         - stop containers"
	@echo "   5. make purge        - stop and remove containers"

build:
	@echo "Building containers..."
	docker image build -t ${PROJECT}-image:${LAST_VERSION} .
	
start:
	@echo "Starting containers..."
	docker container run -d --name ${PROJECT}-container -p 80:80 ${PROJECT}-image:${LAST_VERSION}

deploy: build start

stop:
	@echo "Stoping containers..."
	docker container stop ${PROJECT}-container

purge: stop
	@echo "Purging containers..."
	docker container rm ${PROJECT}-container
	docker image rm ${PROJECT}-image:${LAST_VERSION}
