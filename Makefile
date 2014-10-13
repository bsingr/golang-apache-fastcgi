default: build
build:
	GOOS=linux GOARCH=amd64 go build app.go && mv app public
local:
	go build app.go
