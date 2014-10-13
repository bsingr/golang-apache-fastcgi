EXAMPLES_VANILLA=examples/vanilla
EXAMPLES_BEEGO=examples/beego

default:
	make deploy
	make run
run:
	fig rm --force && fig build && fig up
deploy:
	GOOS=linux GOARCH=amd64 make build
	cp -R ${EXAMPLES_VANILLA} web/public/
	cp -R ${EXAMPLES_BEEGO} web/public/
	make unpack
unpack:
	cd web/public/vanilla && make unpack
	cd web/public/beego && make unpack
build:
	cd ${EXAMPLES_VANILLA} && make pack
	cd ${EXAMPLES_BEEGO} && make pack
bench:
	ab -n 5000 -c 100 -g benchmarks/static.tsv http://localdocker:80/
	ab -n 5000 -c 100 -g benchmarks/vanilla.tsv http://localdocker:81/
	ab -n 5000 -c 100 -g benchmarks/beego.tsv http://localdocker:82/
	make graph
graph:
	gnuplot benchmarks/graph.plot
