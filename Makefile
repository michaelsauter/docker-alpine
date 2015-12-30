TAG ?= 3.3

build: Dockerfile
	docker build -t michaelsauter/alpine:$(TAG) .
	docker tag -f michaelsauter/alpine:$(TAG) michaelsauter/alpine:latest
