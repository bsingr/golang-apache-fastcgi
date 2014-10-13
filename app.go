package main

import (
	"flag"
	"io"
	"log"
	"net/http"
	"net/http/fcgi"
	"runtime"
)

var local = flag.String("local", "", "serve as webserver, example: 0.0.0.0:8000")

func init() {
	runtime.GOMAXPROCS(runtime.NumCPU())
}

func ServeHTTP(w http.ResponseWriter, r *http.Request) {
	headers := w.Header()
	headers.Add("Content-Type", "text/html")
	io.WriteString(w, "<html><head></head><body><p>Hello world from Go!</p></body></html>")
}

func main() {
	http.HandleFunc("/", ServeHTTP)

	flag.Parse()
	var err error

	if *local != "" { // Run as a local web server
		err = http.ListenAndServe(*local, nil)
	} else { // Run as FCGI via standard I/O
		err = fcgi.Serve(nil, nil)
	}
	if err != nil {
		log.Fatal(err)
	}
}
