
TARG=github.com/soundcloud/doozer
GOFILES=\
	conn.go\
	err.go\
	event.go\
	file.go\
	msg.pb.go\
	walk.go\

build:
	go build ./cmd/doozer

install:
	go install ./cmd/doozer

msg.pb.go: msg.proto
	mkdir -p _pb
	protoc --go_out=_pb $<
	cat _pb/$@\
	|sed s/Request/request/g\
	|sed s/Response/response/g\
	|sed s/Newrequest/newRequest/g\
	|sed s/Newresponse/newResponse/g\
	|gofmt >$@
	rm -rf _pb

CLEANFILES+=_pb
