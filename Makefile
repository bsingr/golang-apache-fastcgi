EXAMPLES_VANILLA=examples/vanilla

default:
	make deploy
	make run
run:
	fig rm --force && fig build && fig up
deploy:
	GOOS=linux GOARCH=amd64 make build
	cp -R ${EXAMPLES_VANILLA} web/public/global-conf/
	cp -R ${EXAMPLES_VANILLA} web/public/htaccess-conf/
	make unpack
unpack:
	cd web/public/global-conf/vanilla && make unpack
	cd web/public/htaccess-conf/vanilla && make unpack
build:
	cd ${EXAMPLES_VANILLA} && make pack
