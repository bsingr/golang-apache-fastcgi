package routers

import (
	"golang-apache-fastcgi/examples/beego/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
}
