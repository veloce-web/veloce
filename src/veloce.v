module veloce

import net.http

enum RouteType {
	get
	post
	delete
}

pub type RouteFn = fn (ctx Context) int

struct Route {
	typ  RouteType
	addr string
	func RouteFn
}

struct Handler {
	routes []Route
}

struct Context {
	// TODO: fill this up with goodies
}

fn (h Handler) handle(req http.Request) http.Response {
	mut res := http.Response{
		header: http.new_header_from_map({
			http.CommonHeader.content_type: 'text/plain'
		})
	}
	res.status_code = 200
	return res
}

pub struct Server {
mut:
	srv    http.Server
	port   int
	routes []Route
}

pub fn (mut s Server) serve() {
	s.srv.listen_and_serve()
}

pub fn create(port int) Server {
	tmpnew := Server{
		srv: http.Server{
			handler: Handler{}
			port: port
		}
		port: port
	}

	return tmpnew
}
