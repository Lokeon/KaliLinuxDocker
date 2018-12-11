release: docker_build docker_login docker_push output
dockerId ?= lokeon
DOCKER_IMAGE = $(dockerId)/kali
GIT_COMMIT = $(strip $(shell git rev-parse --short HEAD))
CODE_VERSION = $(strip $(shell cat VERSION))

ifeq ($(MAKECMDGOALS),release)
DOCKER_TAG = $(CODE_VERSION)
else
DOCKER_TAG = $(CODE_VERSION)-$(GIT_COMMIT)
endif

ifndef CODE_VERSION
$(error You need to create a VERSION file to build a release)
endif

docker_login:
	docker login -u $(dockerId) -p $(pswd)

docker_build:
	docker build \
	--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
	--build-arg VERSION=$(CODE_VERSION) \
	--build-arg VCS_URL=`git config --get remote.origin.url` \
	--build-arg VCS_REF=$(GIT_COMMIT) \
	-t $(DOCKER_IMAGE):$(DOCKER_TAG) .

docker_push:
	docker tag $(DOCKER_IMAGE):$(DOCKER_TAG) $(DOCKER_IMAGE):latest
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)
	docker push $(DOCKER_IMAGE):latest

output:
	@echo Docker Image: $(DOCKER_IMAGE):$(DOCKER_TAG)