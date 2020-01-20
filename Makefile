CONTAINER_NAME = streamingtools
TAG_VERSION = latest
PACKAGE_NAME = streamingtools

BUILD_DIR = _build/doc
DIST_DIR = dist

all: clean doc

clean:
	rm -rf $(BUILD_DIR)/*
	rm -rf $(DIST_DIR)/*

drop-pycache:
	find $(CURDIR) -type d -name "__pycache__" -exec rm -rf {} +

docker-build: drop-pycache
	docker build -t $(CONTAINER_NAME):$(TAG_VERSION) .

doc: docker-build
	docker run \
		-v $(CURDIR)/dist:/$(PACKAGE_NAME)/$(DIST_DIR) \
		-it $(CONTAINER_NAME):$(TAG_VERSION) \
		sphinx-build -E -b html -d $(BUILD_DIR)/doc . $(DIST_DIR)/doc

run: docker-build
	docker run \
		-it $(CONTAINER_NAME):$(TAG_VERSION) \
		bash

dev: docker-build
	docker run \
		-v $(CURDIR)/doc:/$(PACKAGE_NAME)/doc \
		-v $(CURDIR)/dist:/$(PACKAGE_NAME)/$(DIST_DIR) \
		-v $(CURDIR)/conf.py:/$(PACKAGE_NAME)/conf.py \
		-v $(CURDIR)/Makefile:/$(PACKAGE_NAME)/Makefile \
		-v $(CURDIR)/readme.rst:/$(PACKAGE_NAME)/readme.rst \
		-v $(CURDIR)/requirements.txt:/$(PACKAGE_NAME)/requirements.txt \
		-it $(CONTAINER_NAME):$(TAG_VERSION) \
		bash
