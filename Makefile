REPO:=martkcz/php-nginx-alpine
VERSION:=8.1.3-r4

all: build release

build:
	docker build -t $(REPO):${VERSION} .

release:
	docker push $(REPO):${VERSION}
