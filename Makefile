#Dockerfile vars
python_version=3.9

#vars
REPO=vwnio
IMAGENAME=ansible
IMAGEFULLNAME=${REPO}/${IMAGENAME}

.DEFAULT_GOAL := build

.PHONY:	help build test push provision shutdown get_ssh_hosts all

help:
	@echo "Makefile arguments:"
	@echo ""
	@echo "python_version - Python version"
	@echo ""
	@echo "Makefile commands:"
	@echo "build"
	@echo "push"
	@echo "all"

build:
	@docker build \
	--build-arg VARIANT="${python_version}" \
	--build-arg VCS_REF=`git rev-parse --short HEAD` \
	--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
	-t ${IMAGEFULLNAME} .

push:
	@docker push ${IMAGEFULLNAME}

all: build push