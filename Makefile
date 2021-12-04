REPO:=martkcz/php-nginx-alpine
VERSION:=8.0.13-r1

all: build release

build:
	docker build -t $(REPO):${VERSION} .

release:
	docker push $(REPO):${VERSION}
