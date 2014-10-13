default: build
run:
	fig rm --force && fig build && fig up
build:
	GOOS=linux GOARCH=amd64 go build app.go && mv app web/public/app.fcgi
local:
	go build app.go
