all: .gotten
	GOPATH=$(shell pwd) go build -o bin/ncdns github.com/hlandau/ncdns

call: all
	sudo setcap 'cap_net_bind_service=+ep' bin/ncdns

.gotten:
	touch .gotten
	GOPATH=$(shell pwd) go get github.com/hlandau/ncdns

get: .gotten

