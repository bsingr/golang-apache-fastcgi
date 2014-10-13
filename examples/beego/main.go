package main

import (
	"github.com/astaxie/beego"
	_ "golang-apache-fastcgi/examples/beego/routers"
)

func main() {
	beego.UseFcgi = true
	beego.UseStdIo = true
	beego.Run()
}
