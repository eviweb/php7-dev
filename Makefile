VENDOR="eviweb"
IMAGE=`basename $(realpath .)`
TAG=$(shell echo $(VENDOR)/$(IMAGE):latest)
PHP_VERSION=`cat $(realpath php-version)`

all:
	make clean
	make build
	make test

build:
	@docker build -t $(TAG) .
	$(CURDIR)/bin/listpkg $(TAG)
	$(CURDIR)/bin/php-version $(TAG)
	@docker tag $(TAG) $(shell echo $(VENDOR)/$(IMAGE):$(PHP_VERSION))
	
clean:
	$(CURDIR)/bin/delimg $(TAG)
	$(CURDIR)/bin/delimg $(shell echo $(VENDOR)/$(IMAGE):$(PHP_VERSION))

	
test:	
	./tests/php-version

.PHONY: build
