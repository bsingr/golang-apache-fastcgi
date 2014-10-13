package main

import (
	"io"
	"log"
	"net/http"
	"net/http/fcgi"
	"os"
	"runtime"
)

var app_addr string

func init() {
	runtime.GOMAXPROCS(runtime.NumCPU())
	app_addr = os.Getenv("APP_ADDR") // e.g. "0.0.0.0:8080" or ""
}

func ServeHTTP(w http.ResponseWriter, r *http.Request) {
	headers := w.Header()
	headers.Add("Content-Type", "text/html")
	io.WriteString(w, "<html><head></head><body><p>Hello world from Go!</p></body></html>")
}

func main() {
	http.HandleFunc("/", ServeHTTP)

	var err error
	if app_addr != "" { // Run as a local web server
		err = http.ListenAndServe(app_addr, nil)
	} else { // Run as FCGI via standard I/O
		err = fcgi.Serve(nil, nil)
	}
	if err != nil {
		log.Fatal(err)
	}
}
