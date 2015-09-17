TAG ?= 3.2

build: Dockerfile
	docker build -t michaelsauter/alpine:$(TAG) .
	docker tag -f michaelsauter/alpine:$(TAG) michaelsauter/alpine:latest
