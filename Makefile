EXAMPLES_VANILLA=examples/vanilla
EXAMPLES_BEEGO=examples/beego

default:
	make deploy
	make run
run:
	fig rm --force && fig build && fig up
deploy:
	GOOS=linux GOARCH=amd64 make build
	cp -R ${EXAMPLES_VANILLA} web/public/global-conf/
	cp -R ${EXAMPLES_BEEGO} web/public/global-conf/
	cp -R ${EXAMPLES_VANILLA} web/public/htaccess-conf/
	cp -R ${EXAMPLES_BEEGO} web/public/htaccess-conf/
	make unpack
unpack:
	cd web/public/global-conf/vanilla && make unpack
	cd web/public/global-conf/beego && make unpack
	cd web/public/htaccess-conf/vanilla && make unpack
	cd web/public/htaccess-conf/beego && make unpack
build:
	cd ${EXAMPLES_VANILLA} && make pack
	cd ${EXAMPLES_BEEGO} && make pack
