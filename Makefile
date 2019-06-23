.DEFAULT_GOAL: docker

# default docker hub
REGISTRY=index.docker.io
REPO=$(REGISTRY)/nirmata/ocr-tesseract-docker
IMAGE_TAG=latest

# docker image build targets
# user must be logged in the $(REGISTRY) to push images
.PHONY: docker-build docker-tag-repo docker-push

docker: docker-build docker-push

docker-build:
	@docker build -t $(REPO):$(IMAGE_TAG) .

docker-push:
	@docker push $(REPO):$(IMAGE_TAG)
