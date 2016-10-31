TAG ?= 3.4

build: Dockerfile
	docker build -t michaelsauter/alpine:$(TAG) .
	docker tag michaelsauter/alpine:$(TAG) michaelsauter/alpine:latest
