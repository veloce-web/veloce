module veloce

import net.http

enum RouteType {
	get
	post
	delete
}

struct Route {
	typ  RouteType
	addr string
}

struct Handler {}

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
pub:
	multi bool
mut:
	srv    http.Server
	port   int
	routes []Route
}

pub fn (mut s Server) serve() {
	if s.multi {
		s.srv.listen_and_serve()
	} else {
	}
}

pub fn create(port int, multi_srv bool) Server {
	tmpnew := Server{
		srv: http.Server{
			handler: Handler{}
			port: port
		}
		port: port
		multi: multi_srv
	}

	return tmpnew
}
