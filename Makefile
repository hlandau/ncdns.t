all: .gotten
	GOPATH=$(shell pwd) go build github.com/hlandau/ncdns

call: all
	sudo setcap 'cap_net_bind_service=+ep' ./ncdns

.gotten:
	touch .gotten
	GOPATH=$(shell pwd) go get github.com/hlandau/ncdns

get: .gotten

