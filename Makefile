TAG ?= latest
REPO ?= poorunga

buildx:
	docker buildx build --push --platform linux/amd64,linux/arm64 -t $(REPO)/go-echo:$(TAG) -f Dockerfile .
