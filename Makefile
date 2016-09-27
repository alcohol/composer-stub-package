all: build run-fg

build:
	docker build -t composer/stub-package .

run-fg:
	docker run --rm -it --name composer-stub-package --publish 8000:80 composer/stub-package

run-bg:
	docker run -d --name composer-stub-package --publish 8000:80 composer/stub-package

stop:
	docker stop composer-stub-package
