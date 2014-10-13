EXAMPLES_VANILLA=examples/vanilla

default:
	make deploy
	make run
run:
	fig rm --force && fig build && fig up
deploy:
	GOOS=linux GOARCH=amd64 make build && \
		cp ${EXAMPLES_VANILLA}/hello_world.fcgi web/public/global-conf/ && \
		cp ${EXAMPLES_VANILLA}/hello_world.fcgi web/public/htaccess-conf/
build:
	cd ${EXAMPLES_VANILLA} && go build hello_world.go && mv hello_world hello_world.fcgi
