module veloce

import net.http

fn test_create() {
	assert create(6969, true) == Server{
		multi: true
		srv: http.Server{
			handler: Handler{}
			port: 6969
		}
		port: 6969
		routes: []
	}
}
