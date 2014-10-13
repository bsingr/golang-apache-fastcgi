default:
	make deploy
	make run
run:
	fig rm --force && fig build && fig up
deploy:
	GOOS=linux GOARCH=amd64 make build && mv hello_world.fcgi web/public/
build:
	go build hello_world.go && mv hello_world hello_world.fcgi
