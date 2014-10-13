# Go + Apache + FastCGI = Go for Shared Hosting

Learning project to deploy a [Go](http://go-lang.org) binary as [FastCGI](http://www.fastcgi.com) script on an [Apache http server](http://httpd.apache.org).

## Examples

 * [Vanilla](./examples/vanilla)
   * Starting point to make any go binary FastCGI compatible.
 * [Beego](./examples/beego)
   * Using the Beego framework right now requires this pull-request [astaxie/beego#858](https://github.com/astaxie/beego/pull/858).

## Getting Started

Please make sure you have [Go](http://go-lang.org) and [Beego](http://beego.me) installed. Then just do:

    $ make

Then open your browser:

    $ open http://localhost

When you are using [docker-osx](https://github.com/noplay/docker-osx):

    $ open http://localdocker

## Why Apache HTTP?

The primary focus of this project is to demo the use of Go binaries in a shared hosting environment.

Also on web servers like Nginx there are seperate start/stop scripts required to [spawn FastCGI processes](http://wiki.nginx.org/FcgiExample#Spawning_a_FastCGI_Process).

## Thanks / References

 * [http://www.dav-muz.net/blog/2013/09/how-to-use-go-and-fastcgi/](http://www.dav-muz.net/blog/2013/09/how-to-use-go-and-fastcgi/)
 * [http://httpd.apache.org/mod_fcgid/mod/mod_fcgid.html](http://httpd.apache.org/mod_fcgid/mod/mod_fcgid.html)
 * [http://golang.org/pkg/net/http/](http://golang.org/pkg/net/http/)

## License

See [LICENSE](LICENSE).
